#!/bin/bash

export PREFIX='usw2devdkm'
export LOCAL_IP=$(wget -qO- http://169.254.169.254/latest/meta-data/local-ipv4)
export Lastdigitip=$(echo $LOCAL_IP | sed -r 's!/.*!!; s!.*\.!!')
export POSTFIXNAME=$(echo $LOCAL_IP | sed -r 's/172.18.//g' | sed -r 's/24//g' | sed 's,/,,g' | sed -r 's/(\s?\.)//g')
export SUBNETID=$(echo $LOCAL_IP | sed -r 's/172.18.//g' | sed -r 's,/24,,g' | sed -r 's/(\s?\.)//g' | sed -r "s/$Lastdigitip//g")
export SERVERNAME="$PREFIX$POSTFIXNAME"
export swarmmode="init"
export forgroundcolor="\033[0;32m"
export resetforgroundcolor="\033[0m"
echo -e $forgroundcolor "********************** Start Configuring $SERVERNAME *****************" $resetforgroundcolor
hostnamectl set-hostname $SERVERNAME
systemctl restart networking

        echo -e $forgroundcolor "Disabling IPv6" $resetforgroundcolor
        echo "net.ipv6.conf.all.disable_ipv6 = 1
        net.ipv6.conf.default.disable_ipv6 = 1
        net.ipv6.conf.lo.disable_ipv6 = 1" | sudo tee /etc/sysctl.d/99-disable-ipv6.conf
        sysctl -p
        service procps restart
        service procps reload

        echo -e $forgroundcolor "Installing Packages" $resetforgroundcolor 
        export DEBIAN_FRONTEND=noninteractive
        apt-get update
        apt-get install nfs-common git -y
        
        echo -e $forgroundcolor "NFS configuration"  $resetforgroundcolor

        mkdir -p /mnt/efs
        mkdir -p /home/aws
        mkdir -p /home/jenkins
        mkdir -p /mnt/nfs-base
         mkdir -p /mnt/nfs-base/aws
        mkdir -p /mnt/nfs-base/dockershare
        

 
        echo -e $forgroundcolor "Restarting and Enabling Services"  $resetforgroundcolor
        systemctl restart smbd nmbd winbind
        systemctl stop samba-ad-dc
        systemctl enable smbd nmbd winbind
        
        echo -e $forgroundcolor "Installing Dokcer EE"  $resetforgroundcolor

        echo  "deb [arch=amd64] https://storebits.docker.com/ee/ubuntu/sub-a389cb6c-f3a4-4060-bd74-34540f061754 xenial stable-17.06 " >> /etc/apt/sources.list

        curl -fsSL  https://storebits.docker.com/ee/ubuntu/sub-a389cb6c-f3a4-4060-bd74-34540f061754/ubuntu/gpg | apt-key  add -
        apt-get update
        apt-get install docker-ee -y
       
        echo -e $forgroundcolor "Docker Joining Swarm"  $resetforgroundcolor

        case "$swarmmode" in
        'worker')
        docker swarm join --token SWMTKN-1-4se1tpq0abyxto3a2zo10tjpkbf22a7jffi205j5ud6bbshe2u-9vi6hi0bvn7aj6ksdahz9oyq2 10.88.88.88:2377
        ;;
        'manager')
         docker swarm join --token SWMTKN-1-4se1tpq0abyxto3a2zo10tjpkbf22a7jffi205j5ud6bbshe2u-9ehiwxjqccbiaih2gkmbvbnx3 10.88.88.88:2377
         
        ;;

        'init')
         docker swarm init
        ;;
               
        *)
        echo -e $forgroundcolor "No Docker Mode Select"  $resetforgroundcolor
        ;;
        esac
       
        echo -e $forgroundcolor "Jenkins Configuration"  $resetforgroundcolor
        echo "svcjenkins      ALL=NOPASSWD: ALL" >> /etc/sudoers
        

        

        echo -e $forgroundcolor "Docker Credentials"  $resetforgroundcolor
        apt-get install awscli golang-go -y
        
        # Install Docker credential helper
        export GOPATH=/home/docker
        mkdir -p $GOPATH
        go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
        cp -frp /home/docker/bin/docker-credential-ecr-login /usr/bin


        # Add aws configuration
        mkdir -p /home/docker/.docker
        mkdir -p /root/.docker
        mkdir -p /home/aws/svcjenkins/.docker
        mkdir -p /home/docker/.aws
        mkdir -p /root/.aws
        mkdir -p /home/aws/svcjenkins/.aws

        echo "[default]
        output = json
        region = us-west-1" > /root/.aws/config
        echo "[default]
        output = json
        region = us-west-1" > /home/docker/.aws/config

        echo "[default]
        aws_access_key_id = #GiveMEAWS_ACCESS_KEY# 
        aws_secret_access_key = #GiveMEAWS_secret_KEY#" > /root/.aws/credentials
        echo "[default]
        aws_access_key_id = #GiveMEAWS_ACCESS_KEY# 
        aws_secret_access_key = #GiveMEAWS_secret_KEY#" > /home/docker/.aws/credentials

        echo "[default]
        aws_access_key_id = #GiveMEAWS_ACCESS_KEY# 
        aws_secret_access_key = #GiveMEAWS_secret_KEY#" > /home/aws/svcjenkins/.aws/credentials

        # Add helper to docker
        echo '{
            "credsStore": "ecr-login"
        }' > /root/.docker/config.json


        echo '{
                "credsStore": "ecr-login"
        }' > /home/docker/.docker/config.json
        
        echo '{
                "credsStore": "ecr-login"
        }' > /home/aws/svcjenkins/.docker/config.json

        # Fix permissions
        chown -R docker.docker /home/docker/.docker
        chown -R docker.docker /home/docker/.aws

        echo -e $forgroundcolor "Enabling IPv6" $resetforgroundcolor
        rm -r /etc/sysctl.d/99-disable-ipv6.conf
        sysctl -p
        service procps restart
        service procps reloady

        echo -e $forgroundcolor "import Jenkins" $resetforgroundcolor
        mkdir -p "/docker/jenkins" 
        chmod 777 -R "/docker/jenkins" 

        echo -e $forgroundcolor "Create Portainers" $resetforgroundcolor
        docker volume create portainer_data
        docker service create --name portainer --publish 9000:9000 --replicas=1 --constraint 'node.role == manager' --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock --mount type=volume,src=portainer_data,dst=/data portainer/portainer -H unix:///var/run/docker.sock
        
        echo -e $forgroundcolor "Create Portainers" $resetforgroundcolor
        useradd -ms /bin/bash svcjenkins 
        usermod -aG docker svcjenkins
        echo "svcjenkins:workshop" | chpasswd



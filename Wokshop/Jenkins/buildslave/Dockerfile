FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk \
        python-pip \
        python-dev \
        gcc \
        phantomjs \
        firefox \
        docker.io
RUN apt-get install -y build-essential \
        libssl-dev \
        libffi-dev
RUN pip install awscli \
        Ghost.py \
        PyMySQL \
        PySelenium \
        WebOb \
        WebTest \
        apipkg \
        asn1crypto \
        beautifulsoup4 \
        cffi \
        colorama \
        coverage \
        cryptography \
        decorator \
        docutils \
        enum34 \
        execnet \
        funcsigs \
        idna \
        ipaddress \
        jsonpatch \
        jsonpickle \
        jsonpointer \
        kafka-python \
        mock-chroot \
        packaging \
        paramiko \
        pbr \
        pip \
        popen \
        py \
        py4j \
        pyasn1 \
        pycparser \
        pymongo \
        pyparsing \
        pytest \
        python-dateutil \
        requests \
        robotframework \
        robotframework-archivelibrary \
        robotframework-databaselibrary \
        robotframework-debuglibrary \
        robotframework-extendedselenium2library \
        robotframework-httplibrary \
        robotframework-kafkalibrary \
        robotframework-mongodblibrary \
        robotframework-pabot \
        robotframework-requests \
        robotframework-ride \
        robotframework-selenium2library \
        robotframework-sshlibrary \
        robotframework-sudslibrary \
        robotremoteserver \
        selenium \
        setuptools \
        six \
        suds \
        waitress
RUN pip install PyJWT
RUN apt-get install -y openssh-server \
        sudo
RUN useradd -ms /bin/bash jenkins
RUN usermod -aG docker jenkins
RUN echo "jenkins:jenkinspassword" | chpasswd
RUN ln -s /usr/bin/java /bin/java
RUN mkdir -p /var/run/sshd
RUN chmod 0755 /var/run/sshd
COPY startup_script.sh startup_script.sh
CMD ./startup_script.sh
#[ TrainingStack](https://trainingstack.io/ " TrainingStack")
You can create your end to end DevOps Pipline in less than eight minutes. **[Sean Mehrabi](https://ca.linkedin.com/in/seanmehrabi "Sean Mehrabi")** was training this solution in a TrainingStack WorkShop. 

## How to setup my computer and DevOps environments in 8 minutes: 

1. Setup your computer. This will help you to manage your DevOps environment faster like a professional DevOps Engineer. 

2. Login to AWS and create an Ubuntu VM 

3. Run the DevOps environment setup and you will have Docker, with Jenkins, Portainer, and many other features setup in your server in less than 8 minutes. 


### Setuping up an admin computer:  

**Windows**
Open **Powershell as administrator** and run the following command: 
```powershell
Invoke-WebRequest https://raw.githubusercontent.com/seanmehrabi/trainingstack/master/admin-computer.ps1 -UseBasicParsing | iex
```

**MAC**

```bash
wget -O - https://raw.githubusercontent.com/seanmehrabi/trainingstack/master/admin-computer-macos.sh | bash
```

### Setuping up your DevOps Server: 
```shell 
sudo bash <(curl -s https://raw.githubusercontent.com/seanmehrabi/trainingstack/master/Wokshop/Jenkins/deploy.sh)
```


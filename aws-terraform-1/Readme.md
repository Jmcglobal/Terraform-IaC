## Terraform simple deployment

- Simple aws resource automation without complexity of using variables, list, Maps, Looping etc

- Terraform-IaC/aws-terraform-2 (aws resource deployment using variables, List, Maps, looping and Toset)

### Resources to be provisioned

#### Virtual Private cloud (VPC)

#### Internet gateway

#### Nat gateway on public subnet

#### Two Private Subnet

#### Two public subnet

#### One private route-table

#### One Public route-table

#### Security groups (Private and public subnet)

#### Two EC2 instances on private subnet

#### Two EC2 instances on public subnets (Jump host to private ec2 instances)

### Overview

![Terra-Project-1-updated](https://github.com/Jmcglobal/Terraform-IaC/assets/101070055/5d209e99-43c1-4e34-9edd-40d4cb3ff250)

### To Deploy ..

- Ensure you have permissions to provision the resources

- Create a key pair using aws console, and download the key to your terminal

- Clone  this repo

- optionally change region of your choice 

             terraform apply --auto-approve

### Confirm the jumb host, ssh to private subnet ec2 through instance on public subnet

- Start the ssh-agent

             $ eval "$(ssh-agent -s)"

- Add your private key to the ssh-agent

            $ ssh-add <path-to-private-key> or <keyname e.g key.pem>

- Connect to the EC2 instance on public subnet

              $ ssh -A <username>@<public-ip-or-hostname>

- Now from inside Public Ec2 instance, access the private instance

                ssh <username>@<instance-private-IP>

### To Destroy

             terraform destroy --auto-approve

NOTE: If this warning pops up while adding key 
        "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0777 for 'Ohio.pem' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored."

Use this command to change it
-          chmod 400 <key-name>

 ## ANOTHER EXAMPLE OF ARCHITECTURE TO AUTOMATE
  
  ![Terraproject--1](https://github.com/Jmcglobal/Terraform-IaC/assets/101070055/dd1de618-a31f-49c5-8584-7f2a2301d481)

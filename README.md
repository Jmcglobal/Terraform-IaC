# TERRAFORM - IAC (Infrastrcture as a Code)
![terra-icon](https://github.com/Jmcglobal/Terraform-IaC/assets/101070055/f988df9e-d213-4ec9-a3e3-6424eb7f107f)           ![terraform-view](https://github.com/Jmcglobal/Terraform-IaC/assets/101070055/904245f9-4aab-43ab-b696-2afc4d47e279)

### WHAT IS TERRAFORM

In simple terms, terraform is an open source tool which was developed and managed by harhicorp, it enables provisioning of cloud infrastructure by just writing a script in .tf format.
It is used to manage and provision infrastructure resources such as physical machines, virtual machines, networking, and cloud resources. It is also used to manage and provision software applications and services. Terraform can be used to automate the deployment of applications and services to multiple cloud providers, including Amazon Web Services, Microsoft Azure, Google Cloud Platform, and more.

### TERRAFORM WORKFLOW

![terraform-disgram](https://github.com/Jmcglobal/Terraform-IaC/assets/101070055/e6b93c8b-7b28-4f2c-a6c9-128cb9199fb9)

#### TERRAFORM INIT

- Used to initialize a working directory containing terraform config files
- This is the first command that should be run after writing a new terraform config files
- It downloads the necessary plugins

#### TERRAFORM VALIDATE

- Validates the terraform configuration files in that respective directory to ensure they are syntactically valid and internally consistent.

#### TERRAFORM PLAN 

- Create an execution plan,
- Terraform performs a refresh and determines what actions are necessary to achieve the desired state specified in configuration files.

#### TERRAFORM APPLY

- It is used to apply the changes required to reach the desired state of teh configuration.
- By default, apply scans the current directory for the configuration and applies the changes appropriately.

#### TERRAFORM DESTROY

- Used to delete the terraform-managed infrastructure
- This will ask for confirmation if --auto-approve is not used.

# Terraform Settings

### Terraform Block.

- This is a special block used to configure some behaviours, 
 
      Required terraform Version
      List required Providers
      Terraform backend

### Provider Block.

- Terraform relies on providers oblock to interact with remote systems (public cloud).

### Resource Block

- Each resource Block describes one or more infrastructure objects.

 Resource syntax (How to declare resource)
 Resource Behaviour (How terraform handles resource declaration)
 

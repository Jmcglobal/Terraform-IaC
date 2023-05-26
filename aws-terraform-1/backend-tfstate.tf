### Optionally configure backend to store resource state file
## Create a bucket with valid name of your choice

# terraform {
#     backend "s3" {
#         bucket = "state-backend"
#         key = "terraform.tfstate"
#         region = "us-east-1"
#         encrypt = true     
#     }
# }

## Uncomment this block if wish to store state file on backend
#Init terraform
terraform init

#Terraform apply with auto approve
terraform apply -auto-approve
#Outputs:
#
#registry_hostname = "msflixtube.azurecr.io"
#registry_pw = <sensitive>
#registry_un = "msflixtube"

#To get the password
terraform output -raw registry_pw

#Get the details of the container registry using Azure CLI
#az acr show --name <your-container-registry-name> --output table
#az acr credential show --name <your-container-registry-name> --output table
az acr show --name msflixtube --output table
az acr credential show --name msflixtube --output table

#Destroy created infrastructure
terraform destroy


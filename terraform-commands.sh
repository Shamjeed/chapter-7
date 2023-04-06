#Terraform init
terraform init

az login
##az account set --subscription <your-subscription-id>

#Terrform apply
terraform apply
#Below error occured
#│ ERROR: AADSTS50076: Due to a configuration change made by your administrator, or because you moved to a new location, you must use multi-factor authentication to access '00000003-0000-0000-c000-000000000000'.
#│ Trace ID: 9f9eb73b-8a50-4513-8134-7157598e7600
#│ Correlation ID: 0ba58003-07db-4080-9fda-cdd7fe47789b
#│ Timestamp: 2023-04-06 17:41:20Z
#│ To re-authenticate, please run:
#│ az login --scope https://graph.microsoft.com//.default
#Solution:
#Setting default subscription is enough like:
##az account set --subscription <your-subscription-id>

#Created an application registration "microboot" under Azure Active Directory > App Registation
#Below mentioned is not required
#?? Then under API persmissions clicked on "Grant admin consent for default directory"

#Finally destroy the infrastructure that terraform created
terraform destroy



#login to azure
az login

#List accounts (JSON)
az account list

##List accounts (table)
az account list --output table

#Name                      CloudName    SubscriptionId                        State    IsDefault
#------------------------  -----------  ------------------------------------  -------  -----------
#Pay-As-You-Go             AzureCloud   e7406931-3126-4cb0-a16a-3aad5e379caa  Enabled  True
#Azure Pass - Sponsorship  AzureCloud   0779a3be-2767-49f8-af9c-d4aca84723af  Enabled  False

#Show default account
az account show

#Show default account
az account show --output table
#EnvironmentName    HomeTenantId                          IsDefault    Name           State    TenantId
#-----------------  ------------------------------------  -----------  -------------  -------  ------------------------------------
#AzureCloud         aa3f550b-f4f2-4c1b-a633-fcc00a9a531a  True         Pay-As-You-Go  Enabled  aa3f550b-f4f2-4c1b-a633-fcc00a9a531a

#Set default account
#az account set --subscription <your-subscription-id>
az account set --subscription e7406931-3126-4cb0-a16a-3aad5e379caa




terraform init

#Get kubernetes versions from location eastus
az aks get-versions --location eastus
#KubernetesVersion    Upgrades
#-------------------  ------------------------
#1.26.0(preview)      None available
#1.25.6               1.26.0(preview)
#1.25.5               1.25.6, 1.26.0(preview)
#1.24.10              1.25.5, 1.25.6
#1.24.9               1.24.10, 1.25.5, 1.25.6
#1.23.15              1.24.9, 1.24.10
#1.23.12              1.23.15, 1.24.9, 1.24.10

#Terraform apply with auto approve
terraform apply -auto-approve
#var.app_name
#  Enter a value: msflixtube
#
#var.kubernetes_version
#  Enter a value: 1.26.0


#TEST everything
#cd chapter-6
#cd example-2
#acr host: msflixtube.azurecr.io
docker build -t video-streaming:1 --file Dockerfile-prod .

#docker tag video-streaming:1 <registry-url>/video-streaming:1
docker tag video-streaming:1 msflixtube.azurecr.io/video-streaming:1

#docker login <registry-url>
docker login msflixtube.azurecr.io

#docker push <registry-url>/video-streaming:1
docker push msflixtube.azurecr.io/video-streaming:1

#To ensure that Kubectl is connected to our new cluster:
#az aks get-credentials --resource-group <your-resource-group> --name <your-cluster-name>
#These are simply derived from the app_name variable whose value you entered in terraform apply from above
az aks get-credentials --resource-group msflixtube --name msflixtube

#Deploy (make sure that container registry name is updated in deploy.yaml file)
kubectl apply -f scripts/deploy.yaml

#Check the deployment
kubectl get pods
kubectl get deployments
kubectl get services

#After testing delete the deployment
kubectl delete -f scripts/deploy.yaml

#CD chapter-7/example-3
#Then destroy the infrastructure
terraform destroy

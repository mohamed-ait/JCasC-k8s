#!/bin/bash

# Activate debugging mode :
set -x 

# Create the namespace :
kubectl create ns jenkins-ns

# Switch to created namespace :
kubens jenkins-ns

# Create ConfigMap and link it to JCasC file:
#kubectl  create configmap jenkins-cm --from-file=./JCasC/jenkins.yaml -n jenkins-ns

# Apply AccessControl configuration files :
kubectl apply -f ./AccessControl/service-account.yaml
kubectl apply -f ./AccessControl/ClusterRole.yaml
kubectl apply -f ./AccessControl/ClusterRoleBinding.yaml

# Apply volumes configuration files :
kubectl apply -f ./volumes

# Apply deployments configuration files : 
kubectl apply -f ./deployments/deployment.yaml
kubectl apply -f ./deployments/service.yaml
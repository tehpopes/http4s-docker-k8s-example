#!/bin/bash

dockerhub_username=$1

# Setup Minikube
minikube start
eval $(minikube docker-env)

echo "Enter dockerhub password."
# Build docker image and push to your registry 
docker login -u $dockerhub_username
docker build -t $dockerhub_username/http4s .
docker push $dockerhub_username/http4s

# Deploy http4s on your K8s cluster
sed -i "s/<username>/$dockerhub_username/g" kubernetes/http4s-deployment.yaml
kubectl apply -f kubernetes/http4s-deployment.yaml
kubectl apply -f kubernetes/http4s-service.yaml


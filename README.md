# http4s-docker-k8s-example
Contains docker-compose that spins up http4s and mongodb container in same network. Also contains kubernetes deployment and service specs for spinning up http4s on minikube.

Docker Compose http4s and mongo deployment instructions:
$ docker compose up

Minikube http4s Deployment Options
1. Run deploy-http4s.sh as shown below 
$ ./deploy-http4s.sh <dockerhub username>
2. Do the following:
	a. Run "minikube start" if you don't have a minikube cluster running
	b. $ eval $(minikube docker-env)
	c. Login to your docker hub account
	d. Change <username> in kubernetes/http4s-deployment.yaml to your dockerhub username
	e. $ kubectl apply -f kubernetes/http4s-deployment.yaml
	f. $ kubectl apply -f kubernetes/http4s-service.yaml
3. Check if http4s hello world endpoint works
$ curl http://$(minikube ip):<Minikube Exposed Port>/hello/world 

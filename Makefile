deploy_deployment:
	kubectl apply -f ./k8s/configs/ -R
	kubectl apply -f ./k8s/volumes/ -R
	kubectl apply -f ./k8s/deployments/ -R

deploy_service:
	kubectl apply -f ./k8s/services/ -R
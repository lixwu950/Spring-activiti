#!/bin/bash
# 自动切换到 Dockerfile 所在的目录
cd "$(dirname "$0")/.."

# 切换 Minikube Docker 环境
eval $(minikube docker-env)

docker info | grep "Name"

# 查看当前 Minikube 节点的 IP 地址
minikube ip

# 查看当前 Minikube 节点的端口映射
minikube service spring-activiti-service --url

# 在 Minikube 的 Docker 里构建镜像
docker build -t spring-activiti:latest .

# 重新部署 Pod
kubectl delete pod -l app=spring-activiti
kubectl apply -f k8s-deploy.yaml


kubectl apply -f k8s-deploy.yaml

# 查看部署情况
kubectl get pods
kubectl describe pod spring-activiti

# 查看服务情况
kubectl get svc
kubectl describe svc spring-activiti-service

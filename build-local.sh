#!/bin/bash
set -e

echo "当前路径: $(pwd)"

# 2. 先导入宿主机已拉的基础镜像到 Minikube
echo "导入基础镜像到 Minikube ..."
minikube image load maven:3.9.6-eclipse-temurin-17
minikube image load eclipse-temurin:17-jdk

# 3. 切换 Docker 环境到 Minikube 内部（让构建镜像直接用 Minikube Docker）
echo "切换到 Minikube Docker 环境..."
eval $(minikube docker-env)

docker info | grep "Name"

# 4. 构建镜像，镜像名 spring-activiti:latest
echo "构建项目镜像 spring-activiti:latest ..."
docker build -t spring-activiti:latest .

# 5. 确保 kubectl 使用 minikube 集群上下文
echo "设置 kubectl context 为 minikube ..."
kubectl config use-context minikube

# 6. 删除旧 Pod，触发滚动更新
echo "删除旧 Pod，准备重新部署 ..."
kubectl delete pod -l app=spring-activiti --ignore-not-found

# 7. 部署 k8s 资源
echo "应用 Kubernetes 配置文件 k8s-deploy.yaml ..."
kubectl apply -f k8s-deploy.yaml

# 8. 查看 Pod 状态
echo "等待 Pod 启动，查询 Pod 状态 ..."
kubectl get pods -l app=spring-activiti

POD_NAME=$(kubectl get pods -l app=spring-activiti -o jsonpath='{.items[0].metadata.name}')
echo "Pod 名称: $POD_NAME"
kubectl describe pod "$POD_NAME"

# 9. 查看服务状态
echo "查询服务 spring-activiti-service ..."
kubectl get svc spring-activiti-service
kubectl describe svc spring-activiti-service

# 10. 查看 Minikube IP 和服务访问 URL
MINIKUBE_IP=$(minikube ip)
SERVICE_URL=$(minikube service spring-activiti-service --url)

echo "Minikube 节点 IP: $MINIKUBE_IP"
echo "服务访问 URL: $SERVICE_URL"

echo "部署完成！"

#!/bin/bash
# 自动切换到 Dockerfile 所在的目录
cd "$(dirname "$0")/.."

# 切换 Minikube Docker 环境
eval $(minikube docker-env)

# 构建镜像
docker build -t spring-activiti:latest .

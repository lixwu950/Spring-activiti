#!/bin/bash
# build-local.sh

# 切换到 Minikube 的 Docker 环境
eval $(minikube docker-env)

# 构建项目镜像
docker build -t spring-activiti:latest .

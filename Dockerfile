# 第一阶段：使用 Maven 镜像构建项目
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# 设置工作目录
WORKDIR /app

# 拷贝项目文件
COPY pom.xml .
COPY src ./src

# 编译项目（跳过测试）
RUN mvn clean package -DskipTests

# 第二阶段：构建运行镜像
FROM eclipse-temurin:17-jdk-alpine

# 设置运行目录
WORKDIR /app

# 复制构建产物（jar 包）
COPY --from=builder /app/target/*.jar app.jar

# 暴露端口（根据你的 Java 项目使用的端口，比如 Spring Boot 默认是 8080）
EXPOSE 8080

# 启动应用
ENTRYPOINT ["java", "-jar", "app.jar"]

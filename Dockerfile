# 阶段1：用 Maven 构建所有模块，使用阿里云镜像加速
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# 使用阿里云 Maven 镜像源
COPY settings.xml /root/.m2/settings.xml

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 阶段2：构建运行镜像，仅复制主模块 JAR
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/ruoyi-admin/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

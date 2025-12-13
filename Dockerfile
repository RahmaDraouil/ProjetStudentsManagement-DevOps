FROM eclipse-temurin:11-jdk-alpine
LABEL maintainer="rahma.draouil@esprit.tn"
LABEL description="Students Management Application - DevOps Project"
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]FROM openjdk:11-jdk-slim
LABEL maintainer="rahma.draouil@esprit.tn"
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

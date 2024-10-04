FROM maven:3.8.6-openjdk-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/spring-explore.jar spring-explore.jar

ENTRYPOINT ["java", "-jar", "spring-explore.jar"]

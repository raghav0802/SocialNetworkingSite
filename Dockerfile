# ---------- Stage 1: Build ----------
FROM maven:3.8.5-openjdk-17-slim AS build

WORKDIR /build

# Copy entire project
COPY . .

# Run build from the root where parent pom.xml is
RUN mvn -pl web.social.network -am clean package -DskipTests

# ---------- Stage 2: Run ----------
FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /build/web.social.network/target/*.jar app.jar

#  Set the active Spring profile to "docker"
ENV SPRING_PROFILES_ACTIVE=docker

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
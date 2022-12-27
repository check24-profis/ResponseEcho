FROM eclipse-temurin:17-jre-jammy

WORKDIR /app
COPY app.jar app.jar
CMD java -Dserver.port=8080 -jar app.jar --spring.profiles.active=prod

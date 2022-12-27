FROM eclipse-temurin:17-jdk-jammy as build

RUN apt-get update \
    && apt-get install -y git

RUN git clone https://github.com/kibotu/ResponseEcho.git

WORKDIR ResponseEcho

RUN ./gradlew stage --s --no-daemon

FROM eclipse-temurin:17-jre-jammy

WORKDIR /app
COPY --from=build ResponseEcho/app.jar app.jar
CMD java -Dserver.port=8080 -jar app.jar --spring.profiles.active=prod

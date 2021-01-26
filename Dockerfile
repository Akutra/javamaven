FROM ubuntu:latest
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install default-jre-headless && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY target/*.jar .
CMD ["java", "-jar", "/usr/src/app/my-app-2.0.jar"]

FROM ubuntu:latest
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install default-jre-headless && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY target/myapp-2.1.jar .
CMD ["java", "-jar", "/usr/src/app/myapp-2.1.jar"]

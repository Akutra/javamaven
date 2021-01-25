#!/bin/bash
name="`mvn help:evaluate -Dexpression=project.name | grep '^[^\[]'`"
version="`mvn help:evaluate -Dexpression=project.version | grep '^[^\[]'`"
echo "FROM ubuntu:latest" > Dockerfile
echo "RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install default-jre-headless && apt-get clean && rm -rf /var/lib/apt/lists/*" >> Dockerfile
echo "WORKDIR /usr/src/app" >> Dockerfile
echo "COPY target/*.jar ." >> Dockerfile
echo "CMD [\"java\", \"-jar\", \"/usr/src/app/$name-$version.jar\"]" >> Dockerfile

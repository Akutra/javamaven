#!/bin/bash
name="$(grep -oPm1 "(?<=<name>)[^<]+" pom.xml)"
version="$(grep -oPm1 "(?<=<version>)[^<]+" pom.xml)"
jarlib="target/$name-$version.jar"
echo "FROM ubuntu:latest" > Dockerfile
echo "RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install default-jre-headless && apt-get clean && rm -rf /var/lib/apt/lists/*" >> Dockerfile
echo "WORKDIR /usr/src/app" >> Dockerfile
echo "COPY $jarlib ." >> Dockerfile
echo "CMD [\"java\", \"-jar\", \"/usr/src/app/$name-$version.jar\"]" >> Dockerfile

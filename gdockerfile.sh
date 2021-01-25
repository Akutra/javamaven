#!/bin/bash
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
echo "FROM ubuntu:latest" > Dockerfile
echo "WORKDIR /usr/src/app" >> Dockerfile
echo "COPY target/*.jar ." >> Dockerfile
echo 'CMD ["java", "-jar", "target/${NAME}-${VERSION}.jar"]' >> Dockerfile

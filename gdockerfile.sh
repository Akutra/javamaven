#!/bin/bash
name="`mvn help:evaluate -Dexpression=project.name | grep '^[^\[]'`"
version="`mvn help:evaluate -Dexpression=project.version | grep '^[^\[]'`"
echo "FROM ubuntu:latest" > Dockerfile
echo "WORKDIR /usr/src/app" >> Dockerfile
echo "COPY target/*.jar ." >> Dockerfile
echo "CMD [\"java\", \"-jar\", \"target/$name-$version.jar\"]" >> Dockerfile

#!/bin/bash
#Compile and generate the jar with dependencies
mvn clean compile assembly:single
#Generate the docker image
docker build -t mix:0.1.0 .
#Run the docker image
docker run -d -p 7000:7000 --name mix mix:0.1.0

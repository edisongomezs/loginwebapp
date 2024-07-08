#!/bin/bash

# Variables
IMAGE_NAME="edisongomezs/loginwebapp"
TAG="latest"
DOCKER_USERNAME="edisongomezs"
DOCKER_PASSWORD="Jeremias**3383"

# Build the Docker image
docker build -t $IMAGE_NAME:$TAG .

# Push the Docker image
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
docker push $IMAGE_NAME:$TAG

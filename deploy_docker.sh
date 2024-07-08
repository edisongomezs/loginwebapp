#!/bin/bash

# Variables
IMAGE_NAME="edisongomezs/loginwebapp"
TAG="latest"
DOCKER_USERNAME="edisongomezs"
DOCKER_PASSWORD="${DOCKER_PASSWORD}"

# Detener y eliminar el contenedor anterior si existe
docker stop docker_web || true
docker rm docker_web || true

# Eliminar la imagen anterior
docker rmi $IMAGE_NAME:$TAG || true

# Construir la nueva imagen
docker build -t $IMAGE_NAME:$TAG .

# Iniciar sesión en Docker Hub y empujar la imagen
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
docker push $IMAGE_NAME:$TAG

# Ejecutar el contenedor con la nueva imagen
docker run -d --name docker_web -p 8080:8080 $IMAGE_NAME:$TAG

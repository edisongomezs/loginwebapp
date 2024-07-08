#!/bin/bash

IMAGE_NAME="edisongomezs/loginwebapp"
TAG="latest"
DOCKER_USERNAME="edisongomezs"
DOCKER_PASSWORD="tu_token_de_acceso"

# Detener y eliminar cualquier contenedor existente
docker ps -q --filter "name=docker_web" | grep -q . && docker stop docker_web && docker rm docker_web || true
docker ps -q --filter "name=docker_web_1" | grep -q . && docker stop docker_web_1 && docker rm docker_web_1 || true

# Eliminar imagen anterior si existe
docker rmi $IMAGE_NAME:$TAG || true

# Construir la nueva imagen
docker build -t $IMAGE_NAME:$TAG .

# Iniciar sesión en Docker Hub
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

# Subir la imagen a Docker Hub
docker push $IMAGE_NAME:$TAG

# Ejecutar el nuevo contenedor
docker run -d --name docker_web -p 8080:8080 $IMAGE_NAME:$TAG

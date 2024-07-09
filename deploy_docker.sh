#!/bin/bash

IMAGE_NAME="edisongomezs/loginwebapp"
TAG="latest"
DOCKER_USERNAME="edisongomezs"
DOCKER_PASSWORD="tu_token_de_acceso"

# Detener y eliminar cualquier contenedor existente
docker ps -q | xargs -r docker stop
docker ps -aq | xargs -r docker rm

# Eliminar todas las imágenes
docker images -q | xargs -r docker rmi -f

# Construir la nueva imagen
docker build -t $IMAGE_NAME:$TAG .

# Iniciar sesión en Docker Hub
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

# Subir la imagen a Docker Hub
docker push $IMAGE_NAME:$TAG

# Ejecutar el nuevo contenedor
docker run -d --name docker_web -p 8080:8080 $IMAGE_NAME:$TAG

# Eliminar imágenes sin etiquetar
docker image prune -f

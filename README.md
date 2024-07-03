# LoginWebApp Deployment

Este proyecto describe cómo desplegar y gestionar la aplicación LoginWebApp utilizando Docker, Ansible, Kubernetes y Jenkins. El despliegue se realiza de forma automática a través de un pipeline de CI/CD.

## Requisitos

- Docker
- Docker Compose
- Ansible
- Kubernetes (EKS)
- Jenkins

## Estructura del Proyecto

- `Dockerfile`: Define la construcción de la imagen Docker para la aplicación LoginWebApp.
- `docker-compose.yml`: Define los servicios Docker necesarios para el despliegue local.
- `mysql-deployment.yml`: Despliegue de MySQL en Kubernetes.
- `mysql-service.yml`: Servicio de MySQL en Kubernetes.
- `loginwebapp-deployment.yml`: Despliegue de LoginWebApp en Kubernetes.
- `loginwebapp-service.yml`: Servicio de LoginWebApp en Kubernetes.
- `create_image_loginwebapp.yml`: Playbook de Ansible para construir y desplegar la imagen Docker de LoginWebApp.
- `kube_deploy.yml`: Playbook de Ansible para desplegar y gestionar servicios en Kubernetes.

## Descripción de los Servidores

### 1. Servidor Jenkins
- **Función**: Orquestador del pipeline CI/CD.
- **Uso**: Ejecuta trabajos de construcción, prueba y despliegue de la aplicación. Copia los archivos necesarios al servidor Ansible y desencadena el despliegue en Kubernetes.

### 2. Servidor Ansible
- **Función**: Motor de automatización.
- **Uso**: Gestiona la infraestructura y el despliegue de aplicaciones. Utiliza playbooks para automatizar la configuración de los servicios y el despliegue de la aplicación en el clúster de Kubernetes.

### 3. Clúster de Kubernetes (EKS)
- **Función**: Plataforma de orquestación de contenedores.
- **Uso**: Aloja y gestiona los contenedores de la aplicación y la base de datos MySQL. Proporciona escalabilidad y alta disponibilidad para los servicios desplegados.

## Despliegue Automático con CI/CD

### Proceso de Despliegue

1. **Construcción y Prueba en Jenkins**:
   - Jenkins ejecuta un trabajo que construye la imagen Docker de la aplicación LoginWebApp.
   - La imagen se empuja a un repositorio Docker.

2. **Automatización con Ansible**:
   - Jenkins copia los archivos de despliegue (`loginwebapp-deployment.yml`, `loginwebapp-service.yml`, `mysql-deployment.yml`, `mysql-service.yml`) al servidor Ansible.
   - Ansible aplica los archivos de configuración en Kubernetes, asegurando que los despliegues y servicios estén actualizados.

3. **Despliegue en Kubernetes**:
   - Ansible crea los despliegues y servicios necesarios en el clúster de Kubernetes.
   - Se configuran volúmenes persistentes y servicios para asegurar la correcta operación de la base de datos MySQL y la aplicación.

### Archivos de Configuración

#### `create_image_loginwebapp.yml`
Automatiza la creación y despliegue de la imagen Docker para LoginWebApp.

#### `kube_deploy.yml`
Gestiona el despliegue de LoginWebApp y MySQL en Kubernetes, incluyendo la actualización de despliegues si las imágenes Docker se actualizan.

### Notas

- **Despliegue Local**: Para pruebas locales, se puede utilizar `docker-compose.yml`.
- **Revisión de Logs**: Es importante revisar los logs de los pods y servicios en Kubernetes para asegurarse de que todo funcione correctamente.
- **Actualización de Configuraciones**: Mantener los archivos de configuración actualizados para reflejar cualquier cambio en la infraestructura o la aplicación.

Con estos pasos y configuraciones, se asegura un flujo de trabajo automatizado y robusto para el despliegue de la aplicación LoginWebApp en un entorno Kubernetes utilizando CI/CD con Jenkins y Ansible.

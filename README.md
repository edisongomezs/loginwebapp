# LoginWebApp Deployment

Este proyecto describe cómo desplegar y gestionar la aplicación LoginWebApp utilizando Docker, Ansible, Kubernetes, Jenkins y otras herramientas adicionales como Ansible Vault, Pingdom, Elasticsearch y Grafana. El despliegue se realiza de forma automática a través de un pipeline de CI/CD.

## Requisitos

- Docker
- Docker Compose
- Ansible
- Ansible Vault
- Kubernetes (EKS)
- Jenkins
- Pingdom
- Elasticsearch
- Grafana

## Estructura del Proyecto

- `Dockerfile`: Define la construcción de la imagen Docker para la aplicación LoginWebApp.
- `docker-compose.yml`: Define los servicios Docker necesarios para el despliegue local.
- `mysql-deployment.yml`: Despliegue de MySQL en Kubernetes.
- `mysql-service.yml`: Servicio de MySQL en Kubernetes.
- `loginwebapp-deployment.yml`: Despliegue de LoginWebApp en Kubernetes.
- `loginwebapp-service.yml`: Servicio de LoginWebApp en Kubernetes.
- `create_image_loginwebapp.yml`: Playbook de Ansible para construir y desplegar la imagen Docker de LoginWebApp.
- `kube_deploy.yml`: Playbook de Ansible para desplegar y gestionar servicios en Kubernetes.
- `vault.yml`: Archivo cifrado con Ansible Vault para almacenar credenciales sensibles.
- `pingdom_create_monitor.sh`: Script para crear un monitor en Pingdom.
- `elasticsearch.yml`: Archivo de configuración para Elasticsearch.
- `logstash-mysql.conf`: Archivo de configuración para Logstash con integración a MySQL.

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

#### `vault.yml`
Contiene credenciales cifradas usando Ansible Vault para mayor seguridad.

#### `pingdom_create_monitor.sh`
Script para crear un monitor en Pingdom y asegurar la disponibilidad de los servicios desplegados.

#### `elasticsearch.yml` y `logstash-mysql.conf`
Archivos de configuración para Elasticsearch y Logstash, permitiendo la integración y monitoreo de logs desde MySQL.

### Notas

- **Despliegue Local**: Para pruebas locales, se puede utilizar `docker-compose.yml`.
- **Revisión de Logs**: Es importante revisar los logs de los pods y servicios en Kubernetes para asegurarse de que todo funcione correctamente.
- **Monitoreo y Alertas**: Pingdom se utiliza para monitorear la disponibilidad de los servicios y Elasticsearch junto con Grafana para la visualización y monitoreo de logs y métricas.
- **Actualización de Configuraciones**: Mantener los archivos de configuración actualizados para reflejar cualquier cambio en la infraestructura o la aplicación.

Con estos pasos y configuraciones, se asegura un flujo de trabajo automatizado y robusto para el despliegue de la aplicación LoginWebApp en un entorno Kubernetes utilizando CI/CD con Jenkins y Ansible, y herramientas adicionales para monitoreo y seguridad.

FROM tomcat:latest

# Eliminar cualquier aplicación predeterminada
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar las aplicaciones predeterminadas de nuevo (si es necesario)
#RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps

# Copiar tu archivo WAR a la ruta correcta en Tomcat
#COPY webapp_content/LoginWebApp.war /usr/local/tomcat/webapps/LoginWebApp.war

# Copiar el contenido extraído del WAR a la ruta correcta en Tomcat
COPY webapp_content/ /usr/local/tomcat/webapps/LoginWebApp/

# Instalar herramientas de red para debugging
RUN apt-get update && apt-get install -y iputils-ping telnet

#!/bin/bash

# Configuración
API_KEY="L-zklezObcdC4KFPaMfwIp-bOrNVFW6i25Nf-rsypCqODvDa5Z85N2tPP1QY1E-trwCGQ_M"
HOST="af1ff656414644715909119ba19bb800-1499347685.us-east-1.elb.amazonaws.com"
CHECK_NAME="WebApp Login"
INTERVAL=1  # Intervalo en minutos

# Mostrar valores para depuración
echo "API_KEY: $API_KEY"
echo "HOST: $HOST"
echo "CHECK_NAME: $CHECK_NAME"
echo "INTERVAL: $INTERVAL"

# Verificar si el monitor ya existe
EXISTING_CHECK=$(curl -s -X GET "https://api.pingdom.com/api/3.1/checks" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" | jq -r '.checks[] | select(.name == "'"$CHECK_NAME"'") | .id')

if [ -n "$EXISTING_CHECK" ]; then
    echo "El monitor '$CHECK_NAME' ya existe con ID: $EXISTING_CHECK"
else
    # Crear Monitor en Pingdom
    RESPONSE=$(curl -s -X POST "https://api.pingdom.com/api/3.1/checks" \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -d '{
              "name": "'"$CHECK_NAME"'",
              "host": "'"$HOST"'",
              "type": "http",
              "url": "/LoginWebApp/index.jsp",
              "port": 8080,
              "resolution": '"$INTERVAL"'
            }')
    echo "Monitor creado: $RESPONSE"
fi

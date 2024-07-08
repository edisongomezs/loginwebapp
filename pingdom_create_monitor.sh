#!/bin/bash

# Configuración
API_KEY="PV897FeJbpu9e5brlSaV484jZBwXDbBKdEQGhEPiHAHlm4pCXUpuvwKH8TYjNFz66V0Djao"
HOST="af1ff656414644715909119ba19bb800-1499347685.us-east-1.elb.amazonaws.com"
CHECK_NAME="WebApp Login"
INTERVAL=1  # Intervalo en minutos

# Mostrar valores para depuración
echo "API_KEY: $API_KEY"
echo "HOST: $HOST"
echo "CHECK_NAME: $CHECK_NAME"
echo "INTERVAL: $INTERVAL"

# Verificar si el monitor ya existe
GET_URL="https://api.pingdom.com/api/3.1/checks"
echo "Solicitud GET a: $GET_URL"
RESPONSE=$(curl -s -X GET "$GET_URL" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Accept: application/json")

echo "Respuesta de la solicitud GET: $RESPONSE"

EXISTING_CHECK=$(echo "$RESPONSE" | jq -r '.checks[]? | select(.name == "'"$CHECK_NAME"'") | .id')

if [ -n "$EXISTING_CHECK" ]; then
    echo "El monitor '$CHECK_NAME' ya existe con ID: $EXISTING_CHECK"
else
    # Crear Monitor en Pingdom
    PAYLOAD=$(cat <<EOF
{
  "name": "$CHECK_NAME",
  "host": "$HOST",
  "type": "http",
  "url": "/LoginWebApp/index.jsp",
  "port": 8080,
  "resolution": $INTERVAL
}
EOF
)

    echo "Payload de la solicitud POST: $PAYLOAD"
    
    POST_URL="https://api.pingdom.com/api/3.1/checks"
    RESPONSE=$(curl -s -X POST "$POST_URL" \
        -H "Authorization: Bearer $API_KEY" \
        -H "Content-Type: application/json" \
        -d "$PAYLOAD")

    echo "Respuesta de la solicitud POST: $RESPONSE"

    if echo "$RESPONSE" | jq -e '.error' >/dev/null; then
        echo "Error al crear el monitor en Pingdom: $(echo "$RESPONSE" | jq -r '.error.errormessage')"
        exit 1
    fi

    echo "Monitor creado: $RESPONSE"
fi

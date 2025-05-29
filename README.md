# n8n-docker

[n8n](https://n8n.io) en Docker.

## Prerrequisitos

1. Instalar [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. En Windows, instalar [Scoop](https://scoop.sh) usando PowerShell:

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    ```

   Y después instalar los comandos necesarios:

    ```powershell
    scoop install make
    ```

## Puesta en marcha

1. Arrancar el contenedor:

    ```shell
    make start
    ```

2. Acceder a [n8n](http://localhost:5678).

## Enviar emails desde n8n

Configurar las credenciales para enviar correo desde n8n a [Mailpit](https://mailpit.axllent.org):

- Usuario: ninguno
- Password: ninguna
- Host: `mailpit`
- Puerto: 1025
- SSL/TLS: no

Los mensajes enviados se pueden ver en [Mailpit](http://localhost:8025).

## Exponer el servicio n8n con ngrok

1. Crear una cuenta de [ngrok](https://ngrok.com/).
2. Solicitar un [token de autenticación](https://dashboard.ngrok.com/get-started/your-authtoken).
3. Solicitar el [dominio gratuito](https://dashboard.ngrok.com/domains).
4. Crear el fichero `.env` a partir de `env-example` y configurar las variables con el token y el dominio.
5. Arrancar los contenedores:

    ```shell
    make start-ngrok
    ```

6. Acceder a [ngrok](http://localhost:4040) donde mostrará la URL pública de acceso a n8n.

## Referencias

- [Docker Installation](https://docs.n8n.io/hosting/installation/docker/)
- [How to set up n8n with Docker Compose & Portainer](https://jannicknijholt.nl/n8n-with-docker-compose/)
- [Using ngrok with n8n to make your workflow public](https://ngrok.com/docs/guides/other-guides/n8n/)
- [Using ngrok with Docker](https://ngrok.com/docs/using-ngrok-with/docker/)

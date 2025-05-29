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

## Referencias

- [Docker Installation](https://docs.n8n.io/hosting/installation/docker/)
- [How to set up n8n with Docker Compose & Portainer](https://jannicknijholt.nl/n8n-with-docker-compose/)

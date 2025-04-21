# Docker VSCode Server Tunnel

Installs VSCode CLI in a docker container and launches a VSCode Server Tunnel which can be accessed through https://vscode.dev/

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker and the Compose plugin](https://docs.docker.com/engine/install/)

## Usage

- Clone this repository
- Tweak the `docker-compose` if needed (optional)
- Build and launch the container via `docker compose`

```
docker compose up -d
```

- Check the docker logs for the authentication code

```
docker logs [container-name]
```

you should see something like

```
*
* Visual Studio Code Server
*
* By using the software, you agree to
* the Visual Studio Code Server License Terms (https://aka.ms/vscode-server-license) and
* the Microsoft Privacy Statement (https://privacy.microsoft.com/en-US/privacystatement).
*
To grant access to the server, please log into https://github.com/login/device and use code ****-****
```

- Login to https://github.com/login/device and use the provided code to authenticate and authorize.

- Check the logs again `docker logs [container-name]` and get the web IDE tunnel link (e.g. `https://vscode.dev/tunnel/[container-name]`)

- Enjoy!
# Open WebUI Docker Manager

This Makefile provides commands to manage the Open WebUI Docker container.

## Requirements

- Docker installed on your system
- Make command-line utility

## Configuration

The following variables can be modified in the Makefile:

- `IMAGE_NAME`: Docker image to use (default: ghcr.io/open-webui/open-webui:main)
- `CONTAINER_NAME`: Name for the Docker container (default: open-webui)
- `HOST_PORT`: Port on the host to map to the container (default: 3000)
- `CONTAINER_PORT`: Port inside the container (default: 8080)
- `VOLUME_NAME`: Name of the persistent Docker volume (default: open-webui)

## Commands

- `make run`: Start the Open WebUI container
- `make stop`: Stop the running container
- `make rm`: Stop and remove the container
- `make restart`: Restart the container (stop, remove, run)
- `make logs`: Display container logs
- `make status`: Show container status
- `make pull`: Pull the latest image from the registry
- `make update`: Update to the latest image (stop, remove, pull, run)

## Usage

To start the container:
```
make run
```

To check status:
```
make status
```

To update to the latest version:
```
make update
```

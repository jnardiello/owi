# Makefile for Open WebUI Docker management

# Define variables
IMAGE_NAME = ghcr.io/open-webui/open-webui:main
CONTAINER_NAME = open-webui
HOST_PORT = 3000
CONTAINER_PORT = 8080
VOLUME_NAME = open-webui

# Default target
.PHONY: all
all: run

# Run the Open WebUI container
.PHONY: run
run:
 docker run -d -p $(HOST_PORT):$(CONTAINER_PORT) --add-host=host.docker.internal:host-gateway -v $(VOLUME_NAME):/app/backend/data --name $(CONTAINER_NAME) --restart always $(IMAGE_NAME)

# Stop the container
.PHONY: stop
stop:
 docker stop $(CONTAINER_NAME)

# Remove the container
.PHONY: rm
rm: stop
 docker rm $(CONTAINER_NAME)

# Restart the container
.PHONY: restart
restart: rm run

# Show container logs
.PHONY: logs
logs:
 docker logs $(CONTAINER_NAME)

# Show container status
.PHONY: status
status:
 docker ps -a | grep $(CONTAINER_NAME)

# Pull latest image
.PHONY: pull
pull:
 docker pull $(IMAGE_NAME)

# Update to latest image
.PHONY: update
update: rm pull run

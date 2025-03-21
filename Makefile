# Makefile for Open WebUI Docker management

# Define variables
IMAGE_NAME = ghcr.io/open-webui/open-webui:main
CONTAINER_NAME = open-webui
HOST_PORT = 3000
CONTAINER_PORT = 8080
VOLUME_NAME = open-webui

# Declare all phony targets in one place
.PHONY: all run stop rm restart logs status pull update

# Default target
all: run

# Run the Open WebUI container
run:
	docker run -d -p $(HOST_PORT):$(CONTAINER_PORT) --add-host=host.docker.internal:host-gateway -v $(VOLUME_NAME):/app/backend/data --name $(CONTAINER_NAME) --restart always $(IMAGE_NAME)

# Stop the container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the container
rm: stop
	docker rm $(CONTAINER_NAME)

# Restart the container
restart: rm run

# Show container logs
logs:
	docker logs $(CONTAINER_NAME)

# Show container status
status:
	docker ps -a | grep $(CONTAINER_NAME)

# Pull latest image
pull:
	docker pull $(IMAGE_NAME)

# Update to latest image
update: rm pull run

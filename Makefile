# Makefile for managing Docker and npm commands

# Docker service name
SERVICE_NAME = yumemi

# Build the Docker image
.PHONY: build
build:
	docker-compose build

# Start the Docker container
.PHONY: up
up:
	docker-compose up

# Stop the Docker container
.PHONY: down
down:
	docker-compose down

# Run npm install inside the Docker container
.PHONY: install
install:
	docker-compose run --rm $(SERVICE_NAME) npm install

# Run npm start inside the Docker container
.PHONY: start
start:
	docker-compose run --rm --service-ports $(SERVICE_NAME) npm start

# Run npm build inside the Docker container
.PHONY: build-app
build-app:
	docker-compose run --rm $(SERVICE_NAME) npm run build
#!/bin/bash

# Start script for ComfyUI Docker container
# This script builds and starts the ComfyUI service using docker compose

set -e  # Exit on any error

echo "Starting ComfyUI Docker container..."

# Check if docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running. Please start Docker first."
    exit 1
fi

# Check if docker-compose.yaml exists
if [ ! -f "docker-compose.yaml" ]; then
    echo "Error: docker-compose.yaml not found in current directory"
    exit 1
fi

# Build and start the container
echo "Building and starting ComfyUI container..."
docker compose up --build -d

# Show container status
echo ""
echo "Container status:"
docker compose ps

echo ""
echo "ComfyUI should be available at: http://localhost:7860"
echo ""
echo "To view logs, run: docker compose logs -f"
echo "To stop the container, run: docker compose down"

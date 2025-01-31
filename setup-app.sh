#!/bin/bash

# Check for required environment variables
# if [ -z "$APP_NAME" ]; then
#     echo "Error: APP_NAME environment variable is not set"
#     exit 1
# fi

# Run additional setup commands
echo "Running setup commands..."

echo "Setting up container"
# Build the installation container
docker compose -f docker-compose.install.yml build --no-cache

# Clean up any dangling images
docker rmi $(docker images -f "dangling=true" -q) || true

# Run the Rails installation script inside the container
docker compose -f docker-compose.install.yml run --rm web "./install-rails.sh"

echo "Setup complete."

git add .
git commit -m "install rails"

echo "Building Dockerfile.dev"

docker compose -f docker-compose.dev.yml build --no-cache

echo "Make sure to update Procfile.dev:"
echo "web: bin/rails server -b 0.0.0.0"

echo ""

echo "For additional cleanup run:"
echo "rm ./Dockerfile.install ./docker-compose.install.yml"

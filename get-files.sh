#!/bin/bash

# Check for required environment variables
# if [ -z "$APP_NAME" ]; then
#     echo "Error: APP_NAME environment variable is not set"
#     exit 1
# fi

# Define repo and branch
REPO_USER="yskarpathiotis"
REPO_NAME="bootkit-rails"
BRANCH="main"  # Change if using a different branch
BASE_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/$BRANCH"

# List of files to download
FILES=(
    ".env"
    "Dockerfile.install"
    "docker-compose.install.yml"
    "Dockerfile.dev"
    "docker-compose.dev.yml"
    "setup-app.sh"
    "install-rails.sh"
    "entrypoint.sh"
)

echo "Downloading files from $REPO_NAME..."

# Loop through and download files
for file in "${FILES[@]}"; do
    echo "Downloading $file..."
    curl -O "$BASE_URL/$file"
done

chmod +x setup-app.sh
chmod +x install-rails.sh
chmod +x entrypoint.sh
echo "All files downloaded."

git init
git add .
git commit -m "Download setup files"


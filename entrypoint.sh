#!/bin/bash
set -e

# Install/update gems
bundle install

# Execute the main command
exec "$@"

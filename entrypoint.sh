#!/bin/bash
set -e

# Install/update gems
bundle install

# ignore issues between local user and docker user when running git commands
git config --global --add safe.directory /rails/.git

# set permissions to access ssh files for kamal
chown -R root:root /root/.ssh
chmod 700 /root/.ssh
chmod 600 /root/.ssh/*

# Execute the main command
exec "$@"

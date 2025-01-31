#!/bin/bash

# Install Rails
gem install rails

# Create new Rails application with PostgreSQL and Tailwind
rails new . -T --css tailwind
# rails new . -d postgresql -T --css tailwind

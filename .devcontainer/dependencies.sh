#!/usr/bin/bash
set -e

echo ">>> Updating package lists..."
sudo apt-get update

# Racket
echo ">>> Installing Racket..."
sudo apt-get install -y racket

# Ruby
echo ">>> Installing Ruby..."
sudo apt-get install -y ruby-full
#!/bin/bash

# init.sh

echo "Starting Laravel application setup..."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "Copying .env.example to .env..."
    cp .env.example .env
fi

echo "Installing Composer dependencies..."
docker-compose exec app composer install

echo "Generating application key..."
docker-compose exec app php artisan key:generate

echo "Setting storage permissions..."
docker-compose exec app chmod -R 775 storage
docker-compose exec app chmod -R 775 bootstrap/cache

echo "Setup completed! You can now access your application at: http://localhost:8000"
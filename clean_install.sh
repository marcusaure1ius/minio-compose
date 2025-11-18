#!/usr/bin/env bash

source .env

# 1. Удаляем папки
echo "Delete folders..."

rm -rf ./minio_data

# 2. Создаем новые папки
echo "Create folders and copy files..."

mkdir -p minio_data
sudo chown -R 1001:1001 ./minio_data*

# 3. Стартуем контейнеры
echo "Starting containers..."

docker compose down --volumes --remove-orphans && docker compose up -d

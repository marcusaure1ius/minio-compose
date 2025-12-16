#!/usr/bin/env bash

# Определяем, что доступно: docker compose или docker-compose
if docker compose version >/dev/null 2>&1; then
    DC="docker compose"
elif docker-compose version >/dev/null 2>&1; then
    DC="docker-compose"
else
    echo "Ошибка: docker compose не найден в системе"
    exit 1
fi

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

$DC down --volumes --remove-orphans && $DC up -d

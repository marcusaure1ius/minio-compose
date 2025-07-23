#!/usr/bin/env bash

source .env

# 1. Удаляем папки
echo "Delete folders..."

rm -rf ./minio_data
rm -rf ./nginx

# 2. Создаем новые папки
echo "Create folders and copy files..."

mkdir -p minio_data
mkdir -p nginx/certs
mkdir -p nginx/conf.d

cp nginx.conf.template nginx/conf.d/nginx.conf.template
sudo chown -R 1001:1001 ./minio_data*

# 3. Генерируем SSL сертификаты
echo "Generating certs..."

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx/certs/${INTERNAL_SERVER_NAME}.key -out nginx/certs/$INTERNAL_SERVER_NAME.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=Dev Bank/OU=IT/CN=$INTERNAL_SERVER_NAME"

# 4. Стартуем контейнеры
echo "Starting containers..."

docker compose down --volumes --remove-orphans && docker compose up -d
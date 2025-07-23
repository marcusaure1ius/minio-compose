# Установка MinIO S3<br/>
fsd

Особенности:
- режим установки - sigle node single drive (SNSD)
- nginx для reverse proxy

## Установка

1. Клонируйте репозиторий

```bash
git clone https://github.com/marcusaure1ius/minio-compose.git
```
2. Поменяйте переменные окружения на нужные вам в файле `.env.example` и перемеинуйте файл в `.env`

3. Сделайте исполняемым файл `clean_install.sh`, который сделает все необходимые приготовления и запустит контенейры

```bash
chmod +x clean_install.sh
```

## Использование

Перейдите по адресу `https://{EXTERNAL_IP_ADDRESS}/minio/ui`, если все успешно, вы увидите страницу входа, используйте логин и пароль из файла `.env`
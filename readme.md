# Установка MinIO S3<br/>

Особенности:
- режим установки - sigle node single drive (SNSD)
- nginx для reverse proxy

### Установка

1. Клонируйте репозиторий и перейдите в папку с проектом

```bash
git clone https://github.com/marcusaure1ius/minio-compose.git
```
2. Поменяйте переменные окружения на нужные вам в файле `.env.example` и переименуйте файл в `.env`

3. Сделайте исполняемым файл `clean_install.sh`, который сделает все необходимые приготовления и запустит контенейры

```bash
chmod +x clean_install.sh
```

### Использование

Перейдите по адресу `https://{EXTERNAL_IP_ADDRESS}/minio/ui` и, если все успешно, вы увидите страницу входа, используйте логин и пароль из файла `.env`

Поскольку в сервисе есть настроенный reverse proxy, для внешних подключей MinIO доступен по `{EXTERNAL_IP_ADDRESS}`, а для локально сети обращение может быть по `{INTERNAL_SERVER_NAME}`. Ссылка на файл в бакете также по умолчанию копируется с доменным именем из `{INTERNAL_SERVER_NAME}`, но вы самостоятельно можете его заменить на `{EXTERNAL_IP_ADDRESS}` и это будет работать.

##### Автор - https://github.com/marcusaure1ius
# bitrix_dockerized_env
Окружение для запуска битрикс через docker. 

Требования к установленному софту:
 - docker (`curl -sSL https://get.docker.com/ | sh`)
 - docker-compose (`sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.15.0/docker-compose-$(uname -s)-$(uname -m)" && sudo chmod +x /usr/local/bin/docker-compose`)

Для отправки почты в контейнере с apache и PHP используется ssmtp - настройки SMTP (подходят для Яндекс.ПДД) 
задаются в переменных окружения в docker-compose.yml. Реализовано выполнение скрипта bitrix/modules/main/tools/cron_events.php 
через интервалы, которые задаются в переменной CRON_INTERVAL_SEC. 

Для запуска установить переменные окружения в файле docker-compose.yml:
 - CRON_INTERVAL_SEC - интервал, с которым будут выполняться агенты (запуск скрипта cron_events.php)
 - SMTP_USER=имя пользователя SMTP
 - SMTP_PASS=пароль SMTP
 - SMTP_REWRITE_DOMAIN=домен в pdd.yandex.ru
 - SMTP_HOSTNAME=хост, который резолвится в DNS для данного хоста
 - MYSQL_PASSWORD=желаемый пароль к БД для пользователя bitrix
 - MYSQL_ROOT_PASSWORD=желаемый пароль к БД для пользователя root

затем выполнить

`id -u ; id -g`

Если UID и GID данного пользователя не равны 1000:1000, то в apache/Dockerfile заменить 1000 на UID и GID данного пользователя (в строках 15 и 16)

`docker-compose build && docker-compose up -d`

затем открыть http://host:8000/restore.php



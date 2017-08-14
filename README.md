# bitrix_dockerized_env
Окружение для запуска битрикс через docker. Для отправки почты используется ssmtp - настройки SMTP (подходят для Яндекс.ПДД) 
задаются в переменных окружения в docker-compose.yml. Реализовано выполнение скрипта bitrix/modules/main/tools/cron_events.php 
через интервалы, которые задаются в переменной CRON_INTERVAL_SEC. 

Для запуска установить переменные окружения в файле docker-compose.yml:
 - CRON_INTERVAL_SEC - интервал, с которым будут в
 - SMTP_USER=имя пользователя SMTP
 - SMTP_PASS=пароль SMTP
 - SMTP_REWRITE_DOMAIN=домен в pdd.yandex.ru
 - SMTP_HOSTNAME=хост, который резолвится в DNS для данного хоста
 - MYSQL_PASSWORD=желаемый пароль к БД для пользователя bitrix
 - MYSQL_ROOT_PASSWORD=желаемый пароль к БД для пользователя root

затем выполнить

`echo $UID`

Если UID данного пользователя не равен 1000, то в apache/Dockerfile заменить 1000 на UID данного пользователя (в строках)

`docker-compose build && docker-compose up -d`

затем открыть http://host:8000/restore.php



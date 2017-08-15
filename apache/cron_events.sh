#!/bin/bash

while :
do
	php -f /var/www/html/bitrix/modules/main/tools/cron_events.php
	touch /var/www/html/bitrix/modules/main/tools/cron_events_last
	sleep $1
done

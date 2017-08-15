#!/bin/sh
chown -R www-data:www-data /var/www/html
# prepare SSMTP
envsubst < /etc/ssmtp/revaliases.tmpl > /etc/ssmtp/revaliases
envsubst < /etc/ssmtp/ssmtp.conf.tmpl > /etc/ssmtp/ssmtp.conf
envsubst < /etc/apache2/conf-enabled/servername.conf.tmpl > /etc/apache2/conf-enabled/servername.conf
screen -d -m /usr/local/sbin/cron_events.sh $CRON_INTERVAL_SEC
ulimit -s unlimited
apache2-foreground

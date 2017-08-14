#!/bin/sh
if [ ! -f /www/index.php ]; then
    cp /usr/local/restore.php /www
    cp /usr/local/bitrixsetup.php /www
    rm -f /www/empty_file_to_www_folder.txt
fi
chown -R www-data:www-data /www
# prepare SSMTP
envsubst < /etc/ssmtp/revaliases.tmpl > /etc/ssmtp/revaliases
envsubst < /etc/ssmtp/ssmtp.conf.tmpl > /etc/ssmtp/ssmtp.conf
envsubst < /etc/apache2/conf-enabled/servername.conf.tmpl > /etc/apache2/conf-enabled/servername.conf
screen -d -m /usr/local/sbin/cron_events.sh $CRON_INTERVAL_SEC
ulimit -s unlimited
apache2-foreground

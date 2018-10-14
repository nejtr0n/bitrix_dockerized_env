FROM php:7.0-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        ssmtp \
        gettext \
        screen && \
        rm -r /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd mysqli mcrypt pdo pdo_mysql mbstring tokenizer iconv
RUN a2enmod rewrite
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data
COPY start.sh /usr/local/sbin/start.sh
COPY php-mail.ini /usr/local/etc/php/conf.d/mail.ini
COPY bitrix.ini /usr/local/etc/php/conf.d/
COPY date-timezone.conf /etc/apache2/conf-enabled/date-timezone.conf
COPY encoding.conf /etc/apache2/conf-enabled/encoding.conf
COPY servername.conf.tmpl /etc/apache2/conf-enabled/servername.conf.tmpl
COPY revaliases.tmpl /etc/ssmtp
COPY ssmtp.conf.tmpl /etc/ssmtp
COPY cron_events.sh /usr/local/sbin/cron_events.sh
CMD ["/usr/local/sbin/start.sh"]


FROM php:7.2-fpm

ENV COMPOSER_ALLOW_SUPERUSER=1 \
       COMPOSER_HOME=/composer

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
       apt-get -y install git unzip libzip-dev libicu-dev libonig-dev && \
       apt-get clean && \
       rm -rf /var/lib/apt/lists/* && \
       docker-php-ext-install intl pdo_mysql zip bcmath

ARG GROUP_NAME=hoge \
       GROUP_ID ${GROUP_ID} \
       USER_NAME=hoge \
       USER_ID ${USER_ID}

RUN groupadd -g $GROUP_ID $GROUP_NAME && \
       useradd -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME && \
       chown -R $USER_NAME:$GROUP_NAME /var/www/ && \
       chmod +x /var/www/ && \
       mkdir /var/run/php-fpm && \
       chown -R $USER_NAME:$GROUP_NAME /var/www/ && \
       chown -R $USER_NAME:$GROUP_NAME /var/run/ && \
       chown -R $USER_NAME:$GROUP_NAME /var/log/

COPY ./infra/docker/php/php-fpm.d/zz-www.conf /usr/local/etc/php-fpm.d/zz-www.conf
COPY ./infra/docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./infra/docker/php/php.ini /usr/local/etc/php/php.ini

USER $USER_NAME

WORKDIR /var/www/backend

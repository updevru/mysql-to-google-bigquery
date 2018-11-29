FROM php:7.2-cli

ENV COMPOSER_ALLOW_SUPERUSER 1

ENV BQ_PROJECT_ID memed-project
ENV BQ_KEY_FILE key.json
ENV BQ_DATASET medicine

ENV DB_DATABASE_NAME medicine
ENV DB_USERNAME mysql_user
ENV DB_PASSWORD secret
ENV DB_HOST mysql-server

RUN apt-get update \
    && apt-get install -y curl sed zlib1g-dev \
    && docker-php-ext-install zip pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./ /var/www/
RUN composer install -d /var/www/
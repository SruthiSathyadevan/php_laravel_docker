FROM php:apache

#WORKDIR /var/www/html/

RUN docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli
RUN apt-get update \
    && apt-get install -y \
    curl \
    software-properties-common \
    zip \
    unzip \
    vim \
    npm
RUN npm install npm@latest -g \
    && npm install n -g \
    && n latest
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1
COPY --from=composer:2.4 /usr/bin/composer /usr/bin/composer
COPY ./composer.* ./


RUN composer install --prefer-dist --no-dev --no-scripts --no-progress --no-interaction
COPY . ./
RUN composer dump-autoload --optimize

WORKDIR /var/www/html/chat/
CMD php artisan serve --host=0.0.0.0 --port=80 \
    && npm run dev
EXPOSE 8181
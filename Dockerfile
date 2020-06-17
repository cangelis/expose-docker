FROM php:7.4-cli

ARG SRC

RUN apt-get update
RUN apt-get install -y git libzip-dev

RUN docker-php-ext-install zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
	&& rm composer-setup.php

COPY ${SRC} /app

RUN cd /app && composer install && chmod a+x /app/expose

ENTRYPOINT ["/app/expose"]

FROM php:7.4-cli

ARG VERSION=master

RUN apt-get update
RUN apt-get install -y git libzip-dev wget zip

RUN docker-php-ext-install zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
	&& rm composer-setup.php

RUN cd /tmp && \
    wget https://github.com/beyondcode/expose/archive/${VERSION}.zip && \
    unzip ${VERSION}.zip && \
    mkdir /app && \
    cp -r expose-${VERSION}/* /app

RUN cd /app && composer install && chmod a+x /app/expose

ENTRYPOINT ["/app/expose"]

FROM php:8.0-fpm-alpine
MAINTAINER OTA

# Install gd, iconv, mbstring, mysql, soap, sockets, zip, and zlib extensions
# $PHPIZE_DEPS include autoconf, make...etc
# see example at https://hub.docker.com/_/php/
RUN apk add --no-cache \
		$PHPIZE_DEPS \
		freetype-dev \
		git \
		libjpeg-turbo-dev \
		libpng-dev \
		libxml2-dev \
		libzip-dev \
		openssh-client \
	&& docker-php-ext-install iconv soap sockets exif bcmath pdo_mysql pcntl \
	&& docker-php-ext-configure gd --with-jpeg --with-freetype \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install zip

RUN pecl install -o -f redis \
		&&  rm -rf /tmp/pear \
		&&  docker-php-ext-enable redis

# setting crontab
COPY ./php/crontab /var/spool/cron/crontabs/root
RUN chmod 0644 /var/spool/cron/crontabs/root
RUN crontab /var/spool/cron/crontabs/root

# add mysqli
RUN printf "\n" | docker-php-ext-install mysqli

# add composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php composer-setup.php \
	&& php -r "unlink('composer-setup.php');" \
	&& mv composer.phar /usr/bin/composer

# change www-data's uid and gid for laravel folder permisstion
RUN apk --no-cache add shadow && \
    usermod -u 1000 www-data && \
    groupmod -g 1000 www-data

WORKDIR /var/www/html/app

CMD ["php-fpm"]

#EOF

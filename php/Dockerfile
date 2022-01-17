FROM php:8.0-fpm
MAINTAINER OTA

RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends \
				vim \
        libmemcached-dev \
        libmcrypt-dev \
        libreadline-dev \
        libgmp-dev \
        libzip-dev \
        libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libssl-dev \
        openssh-server \
        libmagickwand-dev \
        git \
        cron \
        nano \
        libxml2-dev \
        mariadb-client

# Install soap extention
RUN docker-php-ext-install soap

# Install for image manipulation
RUN docker-php-ext-install exif

# Install the PHP pcntl extention
RUN docker-php-ext-install pcntl

# Install the PHP intl extention
RUN docker-php-ext-install intl

# Install the PHP gmp extention
RUN docker-php-ext-install gmp

# Install the PHP zip extention
RUN docker-php-ext-install zip

# Install the PHP pdo_mysql extention
RUN docker-php-ext-install pdo_mysql

# Install the PHP pdo_pgsql extention
RUN docker-php-ext-install pdo_pgsql

# Install the PHP bcmath extension
RUN docker-php-ext-install bcmath

#redis
RUN pecl install -o -f redis \
		&&  rm -rf /tmp/pear \
		&&  docker-php-ext-enable redis

# add mysqli
RUN printf "\n" | docker-php-ext-install mysqli

# add composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php composer-setup.php \
	&& php -r "unlink('composer-setup.php');" \
	&& mv composer.phar /usr/bin/composer

# change www-data's uid and gid for laravel folder permisstion
RUN apt-get install -y --force-yes --no-install-recommends  && \
    usermod -u 1000 www-data && \
    groupmod -g 1000 www-data

WORKDIR /var/www/html/app

COPY ./php/entrypoint.sh /
ENTRYPOINT /entrypoint.sh

RUN chmod +x /entrypoint.sh

# setting crontab
COPY ./php/crontab /var/spool/cron/crontabs/root
RUN chmod 0644 /var/spool/cron/crontabs/root
RUN crontab /var/spool/cron/crontabs/root

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

CMD ["php-fpm"]

#EOF

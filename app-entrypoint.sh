#!/bin/bash

set -e

cron

exec "$@"

docker-php-entrypoint php-fpm

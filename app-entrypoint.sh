#!/bin/bash

set -e

cron

exec "$@"

composer install && composer update

php artisan queue:work --daemon & php artisan octane:start --host=0.0.0.0 --watch 
## docker-compose for laravel

![php-badge](https://img.shields.io/badge/php-%3D8.1-blue)
![mysql-badge](https://img.shields.io/badge/mysql-latest-blue)
![nginx-badge](https://img.shields.io/badge/nginx-latest-blue)
![redis-badge](https://img.shields.io/badge/redis-latest-blue)
## Includes

* php-fpm8.1 & composer
* swoole
* crontab support
### required

```
vim /mysql/sqls/privileges.sql
```

```
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON  * . *  TO 'user'@'%' WITH GRANT OPTION;
```
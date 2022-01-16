FROM mysql/mysql-server:latest

ENV MYSQL_ROOT_PASSWORD root

COPY /mysql/sqls/privileges.sql /docker-entrypoint-initdb.d/privileges.sql
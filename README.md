### required

```
vim /mysql/sqls/privileges.sql
```

```
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON  * . *  TO 'user'@'%' WITH GRANT OPTION;
```
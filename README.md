# LaravelDocker

#### Docker for Laravel PHP Framework.
## Master - Slave
### Master
```
-> CREATE USER 'docker_slave'@'localhost' IDENTIFIED BY 'slave';
-> GRANT REPLICATION SLAVE ON *.* TO docker_slave IDENTIFIED BY 'slave' WITH GRANT OPTION;
-> FLUSH PRIVILEGES;
-> FLUSH TABLES WITH READ LOCK;
-> Dump the Database which is required i.e, part of the slave. ( mysqldump -u root -p mariadb > mariadb-master-dump.sql ).
-> UNLOCK TABLES;
-> SHOW MASTER STATUS;
```
### Slave
```
-> CREATE USER 'docker_slave'@'localhost' IDENTIFIED BY 'slave';
-> GRANT ALL PRIVILEGES ON mariadb.* TO 'docker_slave'@'localhost' WITH GRANT OPTION;
-> FLUSH PRIVILEGES;
-> Import the Database of Master i.e, Dumped database of master server.
-> CHANGE MASTER TO MASTER_HOST='mariadb-master', MASTER_USER='docker_slave', MASTER_PASSWORD='slave', MASTER_PORT=3306, MASTER_LOG_FILE='master-bin.000003', MASTER_LOG_POS=1046, MASTER_CONNECT_RETRY=10, MASTER_USE_GTID=current_pos;
-> START SLAVE;
-> SHOW SLAVE STATUS
```
Note : `If you get error about creating new user failed in 'SHOW SLAVE STATUS', then drop the user from Slave and run 'STOP SLAVE; START SLAVE';`

## Elastic Search
To make it persistent, you can add this line:
`vm.max_map_count=262144`
in your `/etc/sysctl.conf` and run
`$ sudo sysctl -p`
to reload configuration with new value
## Application
Save all the application under `Source` folder. 

Example of folder structure of `Source` after adding `app1` and `app2`.
```
-> Nginx
-> Source
    -> app1
    -> app2
```

Note : `This Repo supports only one Application at a time. (i.e you can run only one application).
To change the application, we need to change the 'root path' in 'Nginx->conf->app.conf''`

## Composer
Go-to the application path (`~/Laravel/Source/app1`) and run the below commands for installing package dependency

### composer install
```
docker run
    --rm
    --interactive
    --tty
    --volume $PWD:/app
    --user $(id -u):$(id -g)
    composer:1.6.4 install
```

### composer require
```
docker run
    --rm
    --interactive
    --tty
    --volume $PWD:/app
    --user $(id -u):$(id -g)
    composer:1.6.4 require predis/predis
```

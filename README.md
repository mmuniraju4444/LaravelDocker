# LaravelDocker

#### Docker for Laravel PHP Framework.

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
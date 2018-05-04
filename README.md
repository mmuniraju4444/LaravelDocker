# LaravelDocker
#### Docker for Laravel PHP Framework.

#Composer
Goto the application path (~/Laravel/Source/app1) and run the below commands for installing package dependency
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
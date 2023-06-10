
# PHP app that runs in Docker container
## Docker image of php+composer+laravel 
In this project php image is extended with additional packages. This php image has to be built first with the instructions defined in the ```Dockerfile```.
```shell
docker build -t php:1.0 .
```
The name of the php image is ```php:1.0```. This name is used in docker-compose.yaml file to run the image with the rest of the containers.\
## Docker-compose.yml file
The purpose of it is to define what images docker needs for the project to run. To create the container cluster.\
Running ```docker-compose up``` with ```-d``` for detach mode, to have terminal back for use.
```shell
docker-compose up -d
```

## View in browser
Now [http://localhost:80/](http://localhost:80/t) will display Laravel landing.\
Now [http://localhost:8000/](http://localhost:8000/t) will display phpMyAdmin landing.\

## Ather Docker commands
To view active containers, use command ```docker ps```:
```shell
docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                                      NAMES
e9d8c7f5107f   phpmyadmin/phpmyadmin   "/docker-entrypoint.…"   34 seconds ago   Up 32 seconds   0.0.0.0:8001->80/tcp                       php_docker_app-phpmyadmin-1
ffe68784d349   mysql:latest            "docker-entrypoint.s…"   34 seconds ago   Up 32 seconds   3306/tcp, 33060/tcp                        php_docker_app-db-1
3396a1c4b8e3   extended-php:1.0        "docker-php-entrypoi…"   34 seconds ago   Up 32 seconds   0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   php_docker_app-www-1
```

## Enough is enough
To stop the container cluster from spinning use ```Ctrl+C``` followed by ```docker-compose down``` to remove the containers.\
To clean everyting ```docker system prune -a```

# Docker

### Containers
## Create and run container
### Server mode (detached)
docker run -d mariadb
### One shot (removed after)
docker run --rm python
### option
-i: redirect standard input
-t: redirect standard output TTY

-v: mount volume (host directory or docker volume)
-v externaldir:containerdir

-e, --env: environment variable
-e PYTHON_VERSION
-e PYTHON_VERSION=3.12

-env-file environment-file

--name containername

-p: port mapping

-w: working directory

## Life cycle
```
docker stop|start|restart mycontainer
docker rm mycontainer
docker rm -f mycontainer
```

## Execute cmd inside a container (after start)
docker exec -it mycontainer mycmd cmdargs

## Supervision
### 
```
docker ps
docker ps -a
```

Status: Up, Exited

### Logs
docker logs mycontainer

## Image
docker image ls

docker image pull mariadb
docker image pull mariadb:latest
docker image pull mariadb:11.2


### Examples
docker run --detach --name mariadb-mountain --env MARIADB_ROOT_PASSWORD=my-secret-pw  mariadb:11.2.2

# bash, powershell, cmd
docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:latest python hello.py
docker run -it --rm -v "${PWD}:/usr/src/myapp" -w /usr/src/myapp python:latest python hello.py
docker run -it --rm -v "%cd%":/usr/src/myapp -w /usr/src/myapp python:latest python hello.py

# volume
docker volume create|inspect|ls|rm|prune


# build image
docker build -t papache:1.0 .

# run httpd container
NB: network settings https://docs.docker.com/network/
    -h|--hostname:  set hostname 

docker run -p 80:80 --name papache -h papache.localdomain -d papache:1.0
docker run -p 127.0.0.1:80:80 --name papache -h papache.localdomain -d papache:1.0
docker ps
docker logs papache

# another container in the same network (bridge)
docker run -it --rm rockylinux:9.3
curl -G http://172.17.0.2

# networks
- bridge
- host
- none

docker run -p 81:80 -h papacheb.localdomain --name papacheb -d papache:1.0
docker run -h papacheh.localdomain --network=host  --name papacheh -d papache:1.0

docker network create reseau
docker network ls
docker network inspect reseau 
(Subnet: 172.18.0.0/16)
docker run -h papache.localdomain --network=reseau  --name papache -d papache:1.0
docker inspect papache
(IP: 172.18.0.2)

docker run -it --rm --network=reseau rockylinux:9.3
(IP: 172.18.0.3)

docker run -it --rm --network container:papache rockylinux:9.3
(fusion ?)

(on both bash)
curl -G http://172.18.0.2

# exec a bash inside httpd container
docker exec -it papache bash


# sequence avec commit to change somethng in a container
docker run  --name papache -h papache.localdomain -d papache:1.0
docker commit papache papache-commit:1.0
docker run -p 89:80 --name papache -h papache.localdomain -d papache-commit:1.0
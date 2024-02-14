# Composition
https://docs.docker.com/compose/

YAML reference:
https://docs.docker.com/compose/compose-file/

# Run composition
docker compose up -d
docker compose down
docker ps

(in the composition directory, default file name)
docker compose ps
docker compose -p composition1 ps
docker compose -f .\Stage202402\composition1\docker-compose.yml ps

docker compose logs
docker compose logs db

docker compose start|stop|restart
docker compose start|stop|restart db

docker compose exec -it db bash
docker compose exec -it db mariadb -u mountain -p dbmountain 
docker compose exec -it db mariadb -u mountain -p dbmountain -e "select * from mountain"
docker compose exec -it db mariadb -u mountain -p dbmountain -e "insert into mountain(name) values ('Mont Vie')" 
docker compose exec -it db mariadb -u mountain -psecret-mountain dbmountain -e "select * from mountain"
docker compose exec -it db mariadb -u mountain -psecret-mountain dbmountain -e "insert into mountain(name) values ('Mont Vie')" 

docker volume rm composition1_datamountain

(connect from service web to service db)
mariadb -u mountain -h db -P 3306 -psecret-mountain dbmountain

docker compose down web
docker compose build web
docker compose up -d web

docker run -it --rm --network=reseau rockylinux:9.3

grep "^Listen" /etc/httpd/conf/httpd.conf 


docker compose -p composition3 up -d
docker compose -p composition3 exec -it web bash
docker exec -it composition3-web-1 bash

docker compose -p composition4 --env-file .env4 up -d

docker compose cp .\config.php web:/var/www/html/
dnf module enable php
dnf module install php/common
dnf install php-mysqlnd
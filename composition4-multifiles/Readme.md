# documentation
https://docs.docker.com/compose/multiple-compose-files/
- extends
- merge (docker.override.yml)
- include

directive refereference:
https://docs.docker.com/compose/compose-file/10-fragments/
https://docs.docker.com/compose/compose-file/13-merge/

# test containers
docker compose exec -it db1 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"
docker compose exec -it db2 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"
docker compose exec -it db3 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"

# See final docker-compose.yml with merge, include, .env done
docker compose config

# composition avec fragment répété
files: docker-compose0.yml (renamed: docker-compose0.yml)

# composition avec extends
files: db.yml, docker-compose.yml

docker compose exec -it db2 mariadb -u mountain -ppassword  -e "show databases"
docker compose exec -it db2 mariadb -u mountain -ppassword dbmountain2 -e "select * from mountain"
docker compose exec -it db3 mariadb -u root -ppassword
    + select user, host from mysql.user;

docker compose exec -it db3 mariadb -u root -ppassword -e "select user, host from mysql.user"
docker compose exec -it db3 mariadb -u root -ppassword -e "show databases"
docker compose exec -it db3 mariadb -u mountain3 -ppassword dbmountain2 -e "select * from mountain"

# composition avec merge
default: merge docker-compose.yml docker-compose.override.yml
docker compose up -d

custom: docker-compose.yml docker-compose.dev.yml
docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d

mariadb -h 127.0.0.1 -u mountain -P 3306 -ppassword dbmountain


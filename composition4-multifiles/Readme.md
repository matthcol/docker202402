# documentation
https://docs.docker.com/compose/compose-file/10-fragments/

# test containers
docker compose exec -it db1 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"
docker compose exec -it db2 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"

# See final docker-compose.yml with merge, include, .env done
docker compose config
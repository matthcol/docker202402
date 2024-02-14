# Composition

Composition with:
- dependencies (depends_on)
https://docs.docker.com/compose/compose-file/05-services/#depends_on
- healthcheck
https://docs.docker.com/compose/compose-file/05-services/#healthcheck
https://mariadb.com/kb/en/using-healthcheck-sh/
- restart
https://docs.docker.com/compose/compose-file/05-services/#restart

docker compose exec -it db mariadb -u mountain -ppassword dbmountain -e "insert into mountain(name) values ('Mont Vie')"
docker compose exec -it db mariadb -u mountain -ppassword dbmountain -e "insert into mountain(name) values ('Vignemale')"
docker compose exec -it db mariadb -u mountain -ppassword dbmountain -e "select * from mountain"

docker compose stop db

-- clone volume (-a: preserve attributes -v: verbose)
docker volume create datamountain-back
docker run --rm `
    -v composition3_datamountain:/from  `
    -v datamountain-back:/to  `
    rockylinux:9.3  `
    bash -c "cd /from; cp -av . /to" 


docker run -p 3308:3306 -v datamountain-cloned:/var/lib/mysql --name dbclone1 -d mariadb:11.2
docker run -p 3309:3306 -v datamountain-import:/var/lib/mysql --name dbclone2 -d mariadb:11.2
docker run -p 3310:3306 -v datamountain-back:/var/lib/mysql --name dbclone3 -d mariadb:11.2

docker exec -it dbclone1 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"
docker compose exec -it db mariadb -u mountain -ppassword dbmountain -e "insert into mountain(name) values ('Pic Origin')"
docker exec -it dbclone1 mariadb -u mountain -ppassword dbmountain -e "insert into mountain(name) values ('Pic Clone1')"
docker exec -it dbclone2 mariadb -u mountain -ppassword dbmountain -e "insert into mountain(name) values ('Pic Clone2')"
docker exec -it dbclone3 mariadb -u mountain -ppassword dbmountain -e "insert into mountain(name) values ('Pic Clone3')"
docker compose exec -it db mariadb -u mountain -ppassword dbmountain -e "select * from mountain"
docker exec -it dbclone1 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"
docker exec -it dbclone2 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"
docker exec -it dbclone3 mariadb -u mountain -ppassword dbmountain -e "select * from mountain"

docker inspect -f '{{ .Mounts }}' dbclone1
docker inspect -f '{{ .Mounts }}' composition3-db-1
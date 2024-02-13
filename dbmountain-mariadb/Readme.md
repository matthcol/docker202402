# Run
docker run `
    --name dbmountain `
    --env MARIADB_DATABASE=dbmountain `
    --env MARIADB_ROOT_PASSWORD=my-secret-pw `
    --env MARIADB_USER=mountain `
    --env MARIADB_PASSWORD=secret-mountain `
    -p 3306:3306 `
    -v "${PWD}\sql:/docker-entrypoint-initdb.d"  `
    -d mariadb:11.2

docker run `
    --name dbmountain2 `
    --env-file envfile `
    -p 3307:3306 `
    -v "${PWD}\sql:/docker-entrypoint-initdb.d"  `
    -d mariadb:11.2

# Exec bash
docker exec -it dbmountain bash
docker exec -it dbmountain bash -c "ls -l /docker-entrypoint-initdb.d"
docker exec -it dbmountain mariadb -u mountain -p dbmountain
docker exec -it dbmountain mariadb -u mountain -p dbmountain -e "select * from mountain"
docker exec -it dbmountain ip a
docker exec -it dbmountain ss -tnlp

# Copy
docker cp read_monts.sql dbmountain:/tmp
docker exec -it dbmountain ls /tmp
docker exec -it dbmountain cat /tmp/read_monts.sql

docker exec -it dbmountain sh -c "mariadb-dump -u mountain -p dbmountain mountain > read_monts.sql"
docker cp dbmountain:/tmp/dump_mountain.sql .

NB: redirect on host (be cautious with encoding!)
docker exec -it dbmountain mariadb-dump -u mountain -p dbmountain mountain > read_monts.sql

# volume
docker volume create datamountain
docker volume ls
(attach this volume with -v to a container)
.\rundb1.ps1

docker exec -it dbmountain mariadb -u mountain -p dbmountain -e "insert into mountain(name) values ('Mont Vie')"
docker exec -it dbmountain mariadb -u mountain -p dbmountain -e "select * from mountain"

(remove container without volume datamountain)
docker rm -f dbmountain

(recreate container)
.\rundb1.ps1


(mount volume on another container, at the same time (read-only))
docker run -it --rm -v datamountain:/mnt:ro bash
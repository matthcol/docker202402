# keep data in an external volume
docker run `
    --name dbmountain `
    --env MARIADB_DATABASE=dbmountain `
    --env MARIADB_ROOT_PASSWORD=my-secret-pw `
    --env MARIADB_USER=mountain `
    --env MARIADB_PASSWORD=secret-mountain `
    -p 3306:3306 `
    -v "${PWD}\sql:/docker-entrypoint-initdb.d"  `
    -v datamountain:/var/lib/mysql `
    -d mariadb:11.2
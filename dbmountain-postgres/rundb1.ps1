# keep data in an external volume
docker run `
    --name dbmountain2 `
    --env POSTGRES_DB=dbmountain `
    --env POSTGRES_USER=mountain `
    --env POSTGRES_PASSWORD=secret-mountain `
    -p 5432:5432 `
    -v "${PWD}\sql:/docker-entrypoint-initdb.d"  `
    -v datamountain2:/var/lib/postgresql/data `
    -d postgres:16
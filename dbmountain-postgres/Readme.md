# PostgreSQL DB container

create volume create datamountain2
./rundb1.sh

docker exec -it dbmountain2 bash
docker exec -it dbmountain2 psql -U mountain -d dbmountain
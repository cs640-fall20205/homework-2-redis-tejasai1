>&2 echo "Connecting to the CLI..."
docker exec -it \
    -e PGPASSWORD=grespost 7dbs_postgres_db \
    psql -U postgres --no-password --dbname=7dbs

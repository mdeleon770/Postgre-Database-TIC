#!/bin/bash

# Define variables for the PostgreSQL service, user, database, and pgAdmin volume
PG_SERVICE_NAME=db
PG_POSTGRES_USER=postgres
PG_DATABASE_NAME=your_database_name  # Replace with your actual database name
PG_IMPORT_FILE=dump.sql
PG_IMPORT_DIR=postgres_import

PGADMIN_VOLUME_NAME=pgadmin-data
PGADMIN_IMPORT_DIR=pgadmin_import

# Find the PostgreSQL container name dynamically
PG_CONTAINER_NAME=$(docker ps --filter "name=${PG_SERVICE_NAME}" --format "{{.Names}}" | head -n 1)

# Import PostgreSQL data
echo "Importing PostgreSQL data..."
docker exec -i $PG_CONTAINER_NAME psql -U $PG_POSTGRES_USER -d $PG_DATABASE_NAME < $PG_IMPORT_DIR/$PG_IMPORT_FILE

# Import pgAdmin data
echo "Importing pgAdmin data..."
docker run --rm -v ${PGADMIN_VOLUME_NAME}:/volume -v $(pwd)/${PGADMIN_IMPORT_DIR}:/backup alpine \
  sh -c "cd /volume && cp -a /backup/. ."

echo "PostgreSQL data has been imported from ${PG_IMPORT_DIR}/${PG_IMPORT_FILE}."
echo "pgAdmin data has been imported from ${PGADMIN_IMPORT_DIR}."

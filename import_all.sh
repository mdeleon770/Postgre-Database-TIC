#!/bin/bash

# Define variables for the PostgreSQL service, user, and pgAdmin volume
PG_SERVICE_NAME=db
PG_POSTGRES_USER=postgres
PG_IMPORT_FILE=dump.sql
PG_IMPORT_DIR=postgres_export

PGADMIN_SERVICE_NAME=pgadmin
PGADMIN_IMPORT_DIR=pgadmin_export

# Find the PostgreSQL container name dynamically
PG_CONTAINER_NAME=$(docker ps --filter "name=${PG_SERVICE_NAME}" --format "{{.Names}}" | head -n 1)

# Import PostgreSQL data
echo "Importing PostgreSQL data..."
cat $PG_IMPORT_DIR/$PG_IMPORT_FILE | docker exec -i $PG_CONTAINER_NAME psql -U $PG_POSTGRES_USER

# Find the pgAdmin container name dynamically
PGADMIN_CONTAINER_NAME=$(docker ps --filter "name=${PGADMIN_SERVICE_NAME}" --format "{{.Names}}" | head -n 1)

# Import pgAdmin data
echo "Importing pgAdmin data..."
sudo docker cp $PGADMIN_IMPORT_DIR/. $PGADMIN_CONTAINER_NAME:/var/lib/pgadmin

# Change ownership of the copied files and directories within the container
echo "Changing ownership of imported pgAdmin data..."
docker exec -u root $PGADMIN_CONTAINER_NAME chown -R pgadmin:pgadmin /var/lib/pgadmin

# Debugging: Check the contents of the pgAdmin directory within the container
echo "Checking imported pgAdmin data..."
docker exec $PGADMIN_CONTAINER_NAME ls -l /var/lib/pgadmin

echo "PostgreSQL data has been imported from ${PG_IMPORT_DIR}/${PG_IMPORT_FILE}."
echo "pgAdmin data has been imported from ${PGADMIN_IMPORT_DIR}."
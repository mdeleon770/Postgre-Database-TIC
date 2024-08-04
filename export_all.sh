#!/bin/bash

# Define variables for the PostgreSQL service, user, and pgAdmin volume
PG_SERVICE_NAME=db
PG_POSTGRES_USER=postgres
PG_EXPORT_FILE=dump.sql
PG_EXPORT_DIR=postgres_export

PGADMIN_VOLUME_NAME=pgadmin-data
PGADMIN_EXPORT_DIR=pgadmin_export

# Create export directories if they don't exist
mkdir -p $PG_EXPORT_DIR
mkdir -p $PGADMIN_EXPORT_DIR

# Find the PostgreSQL container name dynamically
PG_CONTAINER_NAME=$(docker ps --filter "name=${PG_SERVICE_NAME}" --format "{{.Names}}" | head -n 1)

# Export PostgreSQL data
echo "Exporting PostgreSQL data..."
docker exec -t $PG_CONTAINER_NAME pg_dumpall -c -U $PG_POSTGRES_USER > $PG_EXPORT_DIR/$PG_EXPORT_FILE

# Export pgAdmin data
echo "Exporting pgAdmin data..."
docker run --rm -v ${PGADMIN_VOLUME_NAME}:/volume -v $(pwd)/${PGADMIN_EXPORT_DIR}:/backup alpine \
  sh -c "cd /volume && cp -a . /backup"

echo "PostgreSQL data has been exported to ${PG_EXPORT_DIR}/${PG_EXPORT_FILE}."
echo "pgAdmin data has been exported to ${PGADMIN_EXPORT_DIR}."

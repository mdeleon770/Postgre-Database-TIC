#!/bin/bash

# Define variables for the PostgreSQL service, user, and pgAdmin volume
PG_SERVICE_NAME=db
PG_POSTGRES_USER=postgres
PG_IMPORT_FILE=dump.sql
PG_IMPORT_DIR=postgres_export

# Find the PostgreSQL container name dynamically
PG_CONTAINER_NAME=$(docker ps --filter "name=${PG_SERVICE_NAME}" --format "{{.Names}}" | head -n 1)

# Import PostgreSQL data
echo "Importing PostgreSQL data..."
cat ./scripts/postgres_export/dump.sql | docker exec -i $PG_CONTAINER_NAME psql -U $PG_POSTGRES_USER

echo "PostgreSQL data has been imported from ${PG_IMPORT_DIR}/${PG_IMPORT_FILE}."
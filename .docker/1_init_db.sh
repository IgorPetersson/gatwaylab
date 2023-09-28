#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL

    CREATE USER tyk_id PASSWORD 'tyk_id';
    CREATE DATABASE tyk_id;
    GRANT ALL PRIVILEGES ON DATABASE tyk_id TO tyk_id;

    \connect tyk_id;
    CREATE EXTENSION IF NOT EXISTS postgis;
    CREATE EXTENSION IF NOT EXISTS postgis_topology;
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

EOSQL

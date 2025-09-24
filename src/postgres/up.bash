#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

>&2 echo ""
>&2 echo "Starting PostgreSQL..."
>&2 echo ""

docker compose up --detach


>&2 echo ""
>&2 echo "The server is configured as follows:"
>&2 echo ""
>&2 echo "   user: postgres"
>&2 echo "   password: grespost"
>&2 echo "   database: 7dbs"
>&2 echo ""

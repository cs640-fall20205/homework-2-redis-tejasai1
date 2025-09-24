#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

if [ $# -lt 1 ] ; then
    >&2 echo "Please pass a filename as an argument."
    >&2 echo "usage: $0 FILE"
    exit 1
fi

file="${1}"

if [ -e "${file}" ] ; then
    >&2 echo "File exists: ${file}"
    >&2 echo "Either choose a different file name, or delete this one first."
    exit 1
fi

docker exec -it \
    -e PGPASSWORD=grespost 7dbs_postgres_db \
    pg_dump -U postgres --no-password 7dbs > "$file"

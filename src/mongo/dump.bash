#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

docker compose exec mongo mongodump --uri="mongodb://mongo:gonmo@localhost" --out /data/db/dump
cp -R /tmp/mongo/dump "${1}"
sudo rm -rf /tmp/mongo/dump

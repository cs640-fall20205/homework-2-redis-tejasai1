#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

sudo rm -rf /tmp/mongo/dump
sudo cp -R "${1}" /tmp/mongo/dump
docker compose exec mongo mongorestore --uri="mongodb://mongo:gonmo@localhost" /data/db/dump
sudo rm -rf /tmp/mongo/dump

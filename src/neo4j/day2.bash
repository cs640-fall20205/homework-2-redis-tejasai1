#!/usr/bin/env bash

divider() {
    set +x
    echo
    echo
    echo "======================================================"
    echo
    set -x
}

./up.bash
sleep 10

divider

# Check the server is running by displaying metadata.
curl http://localhost:7474/db/data/

divider

# Create a node for author P.G. Wodehouse.
curl -i -XPOST http://localhost:7474/db/data/node \
    -H "Content-Type: application/json" \
    -d '{
        "name": "P.G. Wodehouse",
        "genre": "British Humour"
    }'

divider

# Fetch Wodehouse's genre.
curl http://localhost:7474/db/data/node/0/properties/genre

divider


set +x
./clean.bash
./down.bash
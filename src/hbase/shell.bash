#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

if [ "$1" ] ; then
    echo "Going to try to run the script using the shell in docker."
    docker exec -i hbase /opt/hbase-1.2.6/bin/hbase shell "/scripts/$1"
else
    # Connect to HBase shell
    docker exec -it hbase /opt/hbase-1.2.6/bin/hbase shell
fi

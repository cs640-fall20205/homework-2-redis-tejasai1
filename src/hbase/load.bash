#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

usage() {
    echo
    echo "  Usage: $0 TABLE DIRECTORY"
    echo
    echo "      TABLE to load into."
    echo "      DIRECTORY to load from."
    echo
}

if [ -z "$1" ] ; then
    usage
    echo "  Please provide a table to load into."
    echo
    exit 1
fi


if [ -z "$2" ] ; then
    usage
    echo " Please provide a directory to load from."
    echo
    exit 1
fi

dir=$(basename "$2")
sudo rm -rf "volumes/hbase_data/$dir"
sudo cp -R "$2" "volumes/hbase_data/$dir"

docker exec -it hbase /opt/hbase-1.2.6/bin/hbase org.apache.hadoop.hbase.mapreduce.Import "$1" "/hbase-data/$dir"
#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}"

usage() {
    echo
    echo "  Usage: $0 TABLE DIRECTORY"
    echo
    echo "     TABLE is the table to be saved."
    echo "     DIRECTORY is the name of a new directory to create and save into."
    echo
}

if [ -z "$1" ] ; then
    usage
    echo
    echo "  Please provide a table to save."
    exit 1
fi

if [ -z "$2" ] ; then
    usage
    echo
    echo "  Please provide a new directory to create and save into."
    exit 1
fi

if [ -e "$2" ] ; then
    usage
    echo
    echo "  Directory exists: $2"
    echo "  Please provide a name for a directory that does not exist."
    exit 1
fi

sudo rm -rf "volumes/hbase_data/$1"
docker exec -it hbase /opt/hbase-1.2.6/bin/hbase org.apache.hadoop.hbase.mapreduce.Export "$1" "/hbase-data/$1"

size=$(du -s --block-size=MB volumes/hbase_data/$1 | tail -n 1)
size=${size%MB*}
THRESHOLD=100
if [[ $size -gt $THRESHOLD ]] ; then
    echo "$1 is ${size}MB. It is bigger than ${THRESHOLD}MB."
    echo "We do not want to save this in our repository. Not saving."
    exit 1
fi

sudo mv "volumes/hbase_data/$1" "$2"
echo "saved."
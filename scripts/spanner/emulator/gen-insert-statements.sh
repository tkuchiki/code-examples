#!/bin/bash

config="spanner-emulator"
spanner_instance="test-instance"
spanner_database="test-db"
rows="100000"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [-c GCLOUD_CONFIG] [-i SPANNER_INSTANCE] [-d SPANNER_DATABASE] [-r ROWS]

Generate INSERT statements

Options:
  -i INSTANCE  Spanner instance (default: ${spanner_instance})
  -d DATABASE  Spanner database (default: ${spanner_database})
  -c CONFIG    The gcloud CLI configurations (default: ${config})
  -r rows      Number of rows (default: ${rows})
  -h           Show help message
EOC

    exit 1
}

_uuidgen() {
    local _uname=$(uname)
    if [ "${_uname}" = "Darwin" ]; then
        uuidgen
    elif [ "${_uname}" = "Linux" ]; then
        cat /proc/sys/kernel/random/uuid
    fi
}

while getopts i:d:c:r:h OPT; do
    case $OPT in
        i) spanner_instance="${OPTARG}"
           ;;
        d) spanner_database="${OPTARG}"
           ;;
        c) config="${OPTARG}"
           ;;
        r) rows="${OPTARG}"
           ;;
        h) usage
           ;;
    esac
done

n=1000
if [ ${rows} -le ${n} ]; then
    n=${rows}
fi

l=0
while :; do
    {
        echo -n "INSERT INTO Customer (CustomerId, CreationTimestamp, Name, Address) VALUES "
        for i in $(seq 1 ${n}); do
            _i=$(( ${i} + ${l} ))
            customer_id=$(_uuidgen)
            name="name-${_i}"
            address="address-${_i}"
            echo -n " (\"${customer_id}\", PENDING_COMMIT_TIMESTAMP(), \"${name}\", \"${address}\"),"
        done
    }  | sed -e "s/,$//"
    
    l=$(( ${l} + ${n} ))

    [ ${l} -ge ${rows} ] && break
done

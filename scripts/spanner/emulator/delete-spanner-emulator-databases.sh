#!/bin/bash

config="spanner-emulator"
spanner_instance="test-instance"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [-c GCLOUD_CONFIG] [-i SPANNER_INSTANCE]

Delete databases from Spanner emulator instance

Options:
  -i INSTANCE  Spanner instance (default: ${spanner_instance})
  -c CONFIG    The gcloud CLI configurations (default: ${config})
  -h           Show help message
EOC

    exit 1
}

while getopts i:n:c:h OPT; do
    case $OPT in
        i) spanner_instance="${OPTARG}"
           ;;
        c) config="${OPTARG}"
           ;;
        h) usage
           ;;
    esac
done

for db in $(gcloud --configuration=${config} spanner databases list --instance=${spanner_instance} | awk 'NR>1 {print $1}'); do
    gcloud --configuration=${config} -q spanner databases delete ${db} --instance=${spanner_instance}
done

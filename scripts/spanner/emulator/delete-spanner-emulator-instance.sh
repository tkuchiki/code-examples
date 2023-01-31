#!/bin/bash

config="spanner-emulator"
spanner_instance="test-instance"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [-c GCLOUD_CONFIG] [-i SPANNER_INSTANCE]

Delete a instance from Spanner emulator

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

gcloud --configuration=${config} -q spanner instances delete ${spanner_instance}

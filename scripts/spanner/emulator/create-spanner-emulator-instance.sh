#!/bin/bash

config="spanner-emulator"
spanner_nodes="1"
spanner_instance="test-instance"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [-c GCLOUD_CONFIG] [-n NODES] [-i SPANNER_INSTANCE]

Create a Spanner instance in Spanner emulator

Options:
  -i INSTANCE  Spanner instance (default: ${spanner_instance})
  -n NODES     Spanner nodes (default: ${spanner_nodes})
  -c CONFIG    The gcloud CLI configurations (default: ${config})
  -h           Show help message
EOC

    exit 1
}

while getopts i:n:c:h OPT; do
    case $OPT in
        i) spanner_instance="${OPTARG}"
           ;;
        n) spanner_nodes="${OPTARG}"
           ;;
        c) config="${OPTARG}"
           ;;
        h) usage
           ;;
    esac
done

gcloud --configuration=${config} spanner instances create ${spanner_instance} \
   --config=emulator-config --description="Test Instance" --nodes=${spanner_nodes}

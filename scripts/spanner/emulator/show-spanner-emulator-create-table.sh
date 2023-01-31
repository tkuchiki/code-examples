#!/bin/bash

config="spanner-emulator"
spanner_instance="test-instance"
spanner_database="test-db"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [-c GCLOUD_CONFIG] [-i SPANNER_INSTANCE] [-d SPANNER_DATABASE]

Describe the DDL for a Spanner database from the Spanner emulator instance

Options:
  -i INSTANCE  Spanner instance (default: ${spanner_instance})
  -d DATABASE  Spanner database (default: ${spanner_database})
  -c CONFIG    The gcloud CLI configurations (default: ${config})
  -h           Show help message
EOC

    exit 1
}

while getopts i:d:c:h OPT; do
    case $OPT in
        i) spanner_instance="${OPTARG}"
           ;;
        d) spanner_database="${OPTARG}"
           ;;
        c) config="${OPTARG}"
           ;;
        h) usage
           ;;
    esac
done

set -ue

gcloud --configuration=${config} spanner databases ddl describe ${spanner_database} --instance=${spanner_instance}

#!/bin/bash

config="spanner-emulator"
spanner_instance="test-instance"
spanner_database="test-db"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [-c GCLOUD_CONFIG] [-i SPANNER_INSTANCE] [-d SPANNER_DATABASE] -s SCHEMA_FILE

Create tables in Spanner emulator

Options:
  -i INSTANCE  Spanner instance (default: ${spanner_instance})
  -d DATABASE  Spanner database (default: ${spanner_database})
  -s SCHEMA_FILE  Schema SQL file
  -c CONFIG    The gcloud CLI configurations (default: ${config})
  -h              Show help message
EOC

    exit 1
}

while getopts i:d:c:s:h OPT; do
    case $OPT in
        i) spanner_instance="${OPTARG}"
           ;;
        d) spanner_database="${OPTARG}"
           ;;
        s) schema_file="${OPTARG}"
           ;;
        c) config="${OPTARG}"
           ;;
        h) usage
           ;;
    esac
done

set -ue

gcloud --configuration=${config} spanner databases ddl update ${spanner_database} --instance=${spanner_instance} --ddl-file="${schema_file}"

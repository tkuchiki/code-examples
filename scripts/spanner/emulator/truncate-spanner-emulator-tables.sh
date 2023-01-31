#!/bin/bash

config="spanner-emulator"
spanner_instance="test-instance"
spanner_database="test-db"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [-c GCLOUD_CONFIG] [-i SPANNER_INSTANCE] [-d SPANNER_DATABASE]

Delete all rows from Spanner tables in the Spanner emulator

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

tables="SELECT
  table_name
FROM
  information_schema.tables
WHERE
  table_schema = ''"

for db in $(gcloud --configuration=${config} spanner databases list --instance=${spanner_instance} | awk 'NR>1 {print $1}'); do
    echo "# database: ${db}"
    for table in $(gcloud --configuration=${config} spanner databases execute-sql ${db} --instance=${spanner_instance} --sql="${tables}" | awk 'NR>1'); do
        echo "## table: ${table}"
        gcloud --configuration=${config} spanner databases execute-sql ${db} --instance=${spanner_instance} --sql="DELETE FROM ${table} WHERE 1=1"
        echo
    done
done

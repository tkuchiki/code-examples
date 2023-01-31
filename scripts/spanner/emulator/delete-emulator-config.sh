#!/bin/bash

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [GCLOUD_CONFIG=spanner-emulator]

Delete a gcloud config for spanner emulator

Options:
  -h  Show help message
EOC

    exit 1
}

[ "${1}" = "-h" -o "${1}" = "--help" ] && usage

config="${1:-spanner-emulator}"

gcloud config configurations delete ${config}

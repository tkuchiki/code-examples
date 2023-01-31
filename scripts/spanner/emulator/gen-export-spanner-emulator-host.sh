#!/bin/bash

emulator_port="${1:-9010}"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [SPANNER_EMLATOR_PORT=9010]

Generate a "export SPANNER_EMULATOR_HOST=localhost:${emulator_port}"

Options:
  -h  Show help message
EOC

    exit 1
}

[ "${1}" = "-h" -o "${1}" = "--help" ] && usage

echo "export SPANNER_EMULATOR_HOST=localhost:${emulator_port}"

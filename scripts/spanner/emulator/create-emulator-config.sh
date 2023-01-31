#!/bin/bash

config="spanner-emulator"
gcp_project="test-project"

usage() {
    local _script="$(basename ${0})"
    
    cat <<EOC
Usage: ${_script} [-h] [-p GCP_PROJECT] [-c GCLOUD_CONFIG]

Create a gcloud config for spanner emulator

Options:
  -p GCP_PROJECT  GCP project
  -c CONFIG       The gcloud CLI configurations

  -h              Show help message
EOC

    exit 1
}

while getopts c:p:h OPT; do
    case $OPT in
        c) config="${OPTARG}"
           ;;
        p) gcp_project="${OPTARG}"
           ;;
        h) usage
           ;;
    esac
done

gcloud config configurations create ${config} --no-activate
gcloud --configuration=${config} config set auth/disable_credentials true
gcloud --configuration=${config} config set project ${gcp_project}
gcloud --configuration=${config} config set api_endpoint_overrides/spanner "http://localhost:9020/"

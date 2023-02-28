#!/bin/bash

if [ "${PAGERDUTY_API_KEY}" = "" ]; then
    echo "\$PAGERDUTY_API_KEY is required."
    exit 1
fi

get_primary_oncallers() {
    local escalation_policy_id="${1}"

    curl -s --request GET \
         --url "https://api.pagerduty.com/oncalls?escalation_policy_ids%5B%5D=${escalation_policy_id}" \
         --header 'Accept: application/vnd.pagerduty+json;version=2' \
         --header "Authorization: Token token=${PAGERDUTY_API_KEY}" \
         --header 'Content-Type: application/json' | jq -r '.oncalls[] | select(.escalation_level == 1).user.id'
}

get_user_email() {
    local user_id="${1}"

    curl -s --request GET \
         --url "https://api.pagerduty.com/users/${user_id}" \
         --header 'Accept: application/vnd.pagerduty+json;version=2' \
         --header "Authorization: Token token=${PAGERDUTY_API_KEY}" \
         --header 'Content-Type: application/json' | jq -r '.user.email'
}

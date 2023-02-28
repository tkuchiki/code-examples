#!/bin/bash

source "pagerduty.sh"

escalation_policy_id="${1}"

if [ "${escalation_policy_id}" = "" ]; then
    echo "\$1 (escalation policy ID) is required."
    exit 1
fi

for user_id in $(get_primary_oncallers "${escalation_policy_id}"); do
    get_user_email "${user_id}"
done

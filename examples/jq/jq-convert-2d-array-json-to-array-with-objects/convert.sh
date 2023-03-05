#!/bin/bash

jq '.[0] as $headers | .[1:][] | with_entries(.key = $headers[.key])' ${1} | jq -s .

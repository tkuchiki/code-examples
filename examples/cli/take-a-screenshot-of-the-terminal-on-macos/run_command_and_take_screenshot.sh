#!/bin/bash

terminal_app="iTerm2"

get_window_id() {
    osascript -e "tell app \"${1}\" to id of window 1"
}

"${@:2}"

case "${1}" in
    file)
        screencapture -T0 -x -l$(get_window_id "${terminal_app}") /tmp/$(date +'%Y%m%d-%H%M%S').png
        ;;
    clipboard)
        screencapture -T0 -x -l$(get_window_id "${terminal_app}") -c
        ;;
esac

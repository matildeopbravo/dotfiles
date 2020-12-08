#!/bin/bash

if [ "$1" == "DND" ]; then

    if [ -e /tmp/.dnd ] && [ "$(pgrep Discord)" ]
    then
        echo "DND"
    else
        echo
    fi
elif [ "$1" == "mic"  ]; then

    bool=$(pacmd list-sources | grep -A 7 RUNNING | tail -1 | cut -d ' ' -f 2)

    if [ "$bool" == yes ]
    then
        echo 
    else
        echo 
    fi

fi

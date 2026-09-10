#!/bin/bash
export PATH="$PATH:/home/arefin/.spicetify"

if pgrep -x spotify > /dev/null; then
    spicetify refresh -s
fi

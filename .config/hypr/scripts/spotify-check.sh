#!/bin/bash
if ! pgrep -x spicetify > /dev/null; then
    spicetify apply -n
fi

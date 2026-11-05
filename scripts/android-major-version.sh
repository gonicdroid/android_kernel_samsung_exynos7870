#!/bin/sh

MAJOR=$(echo $1 | cut -d '.' -f 1)
MAJOR=$((MAJOR + 103))
if [ "$MAJOR" -gt 113 ]; then
    MAJOR=113
fi
printf "%b" "$(printf '\\%03o' $MAJOR)"


#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload primary &
done

echo "Should work"

#!/bin/bash

killall -q polybar
while prgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch polybar

for m in $(polybar --list_monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload primary &
done

echo "Should work"
#!/bin/bash

killall -q polybar

sleep 1;

for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload main &
done

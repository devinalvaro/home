#!/usr/bin/env sh

print_batt() {
    capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
    status="$(cat /sys/class/power_supply/BAT0/status)"
    echo "${capacity}% ${status}"
}

while :; do
    print_batt
    sleep 1
done

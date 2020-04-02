#!/bin/bash

fnlog="log.txt"

echo "Host name: " `hostname` > $fnlog
echo "OS version: " `lsb_release -d | cut -d$'\t' -f2`
echo "CPU cores:" `cat /proc/cpuinfo | grep processor | wc -l`
echo "RAM: " `free -t -h | grep Mem |'awk '{print $2}'`
echo "HDD size: " `df -h / | sed -n '1!p' | awk 'print $2}'` 
echo "HDD disk usage: " `df -h / | sed -n '1!p' | awk 'print $2}'`

echo "Hello from master branch"

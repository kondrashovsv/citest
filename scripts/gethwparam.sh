#!/bin/bash

fnlog="log.txt"

echo "Host name: " `hostname` > $fnlog
echo "OS version: " `lsb_release -d | cut -d$'\t' -f2`
echo "CPU cores:"
echo "RAM: "
echo "HDD size: "
echo "HDD disk usage: "

echo "Hello from master branch"

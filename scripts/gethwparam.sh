#!/bin/bash

fnlog="log.txt"

echo "Host name: " `hostname` > $fnlog
echo "OS version: " `lsb_release -d | cut -f2` >> $fnlog
echo "CPU cores:" `cat /proc/cpuinfo | grep processor | wc -l` >> $fnlog
echo "RAM: " `free -t -h | grep Mem | awk '{print $2}'` >> $fnlog
echo "HDD size: " `df -h / | sed -n '1!p' | awk '{print $2}'` >> $fnlog
echo "HDD disk usage: " `df -h / | sed -n '1!p' | awk '{print $3}'` >> $fnlog


echo "Hello from master branch"

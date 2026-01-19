#!/bin/bash

echo -n "💾 "
free -b | awk '/^Mem:/ {used=$3/1024/1024/1024; total=$2/1024/1024/1024; printf("%.1f G / %.1f G\n", used, total)}'


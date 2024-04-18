#!/bin/bash
#предполагается, что диск только один

occupied_mem=$(df -h | grep '^/dev' | awk '{print $5}')

occupied_mem=${occupied_mem:0:2}

if (( $occupied_mem > 15 )); then
  echo "Less space available - currently you're using $occupied_mem% of disk space" | \
  mail -s "Server memory status" mail@gmail.com -aFrom:mail@yandex.ru
fi

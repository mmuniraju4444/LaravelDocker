#!/bin/sh
if [ $(pidof telegraf | wc -w) -eq 0 ]; then (nohup telegraf --quiet &) fi
/usr/bin/supervisord -n -c /etc/supervisord.conf
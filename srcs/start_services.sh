#!/bin/sh

nginx

service ssh start

tor -f /etc/tor/torrc

tail -f /var/log/tor/notices.log

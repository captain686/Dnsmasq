#! /bin/bash

cat << EOF > /etc/dnsmasq.conf
no-resolv
server=8.8.8.8
server=1.1.1.1
server=114.114.114.114
strict-order
listen-address=$(ip route | grep default | awk '{print $9}')
addn-hosts=/etc/hosts.dnsmasq
cache-size=0
EOF
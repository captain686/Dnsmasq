#! /bin/bash

cat << EOF > /etc/dnsmasq.conf
resolv-file=/etc/resolv.dnsmasq.conf
strict-order
listen-address=$(ip route | grep default | awk '{print $9}')
addn-hosts=/etc/hosts.dnsmasq
EOF
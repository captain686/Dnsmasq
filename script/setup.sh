#! /bin/bash

apt update && apt upgrade -y

apt install -y dnsmasq iproute2

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak

cat << EOF > /etc/resolv.dnsmasq.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 1.1.1.1
EOF

cat << EOF > /dnsmasq.sh
#! /bin/bash

if [ -f "/etc/dnsmasq.conf" ];then
    cat /etc/dnsmasq.conf
else
    chmod 777 /tmp/script/create_config.sh
    bash /tmp/script/create_config.sh
    rm /tmp/script/create_config.sh
fi

/etc/init.d/dnsmasq start
sleep infinity
EOF

chmod 777 /dnsmasq.sh

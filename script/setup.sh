#! /bin/bash

apt update && apt upgrade -y

apt install -y dnsmasq iproute2

mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak

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

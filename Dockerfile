FROM ubuntu

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN echo 'Asia/Shanghai' >/etc/timezone

COPY script /tmp/script

RUN mv /tmp/script/hosts.dnsmasq /root/hosts.dnsmasq

RUN chmod 777 /tmp/script/setup.sh &&\
    bash /tmp/script/setup.sh &&\
    ln -s /root/hosts.dnsmasq /etc/hosts.dnsmasq

EXPOSE 53

CMD ["bash", "/dnsmasq.sh"]
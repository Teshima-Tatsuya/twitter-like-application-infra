#!/bin/bash 
echo ECS_CLUSTER=twitter >> /etc/ecs/ecs.config
yum install -y iptables-services
iptables -F
echo 1 > /proc/sys/net/ipv4/ip_forward
echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
service iptables save
systemctl start iptables
systemctl enable iptables
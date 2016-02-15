#!/bin/bash

set -x

# Install additional packages
yum install -y kernel-devel-$(uname -r)

# Enable iptables, disable firewalld
systemctl enable iptables
systemctl disable firewalld

# Disable ipv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

# Disable DNS lookups to speed up SSH
sed -i '/UseDNS/d' /etc/ssh/sshd_config
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove Grub timeout to Speed up boot
sed -i 's/^GRUB_TIMEOUT.*/GRUB_TIMEOUT=0/g' /etc/default/grub
grub2-mkconfig --output=/boot/grub2/grub.cfg

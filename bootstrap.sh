#!/bin/sh
# Bootstrap script for CentOS 7

USER=user
SERVER=server

adduser $USER
usermod -a -G wheel $USER

# Disable SELinux
setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# Enable Password Authentication
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd.service

# Modify server name
hostnamectl set-hostname $SERVER
systemctl restart systemd-hostnamed

# Modify DNS Search suffix
echo -e 'SEARCH=internal' >> /etc/sysconfig/network

# Setting VIM
yum -y install vim
echo -e '\ncolorscheme elflord\nset tabstop=4\nset tabstop=3\nset expandtab\nset encoding=utf-8' >> /etc/vimrc



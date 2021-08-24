#!/bin/bash

#This script is to automatically setup and seure a VPS
#make sure you create a new user prir to running
# useradd -m -G sudo havn

#update
sudo apt update && sudo apt upgrade -y

#install ufw and fail2ban
sudo apt install ufw fail2ban -y

#ufw rules
sudo ufw enable -y
sudo ufw deny 445
sudo ufw deny 4899
sudo ufw deny 4444
sudo ufw allow 22

#---------------------------------------------------------------------------------

#turn below into sed 

 #turn 

 # ok icmp codes for INPUT
#-A ufw-before-input -p icmp --icmp-type destination-unreachable -j ACCEPT
#-A ufw-before-input -p icmp --icmp-type source-quench -j ACCEPT
#-A ufw-before-input -p icmp --icmp-type time-exceeded -j ACCEPT
#-A ufw-before-input -p icmp --icmp-type parameter-problem -j ACCEPT
#-A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT
	#into
#-A ufw-before-input -p icmp --icmp-type destination-unreachable -j DROP
#-A ufw-before-input -p icmp --icmp-type source-quench -j DROP
#-A ufw-before-input -p icmp --icmp-type time-exceeded -j DROP
#-A ufw-before-input -p icmp --icmp-type parameter-problem -j DROP
#-A ufw-before-input -p icmp --icmp-type echo-request -j DROP

#/etc/fail2ban/jail.conf
# [sshd] \n\ #enabled = true
# [sshd] \n\ enabled = true

#bantime = 1h
#bantime = 10000h
#---------------------------------------------------------------------------------
sudo sed 's/-A ufw-before-input -p icmp --icmp-type destination-unreachable -j ACCEPT /-A ufw-before-input -p icmp --icmp-type destination-unreachable -j DROP/g' /etc/ufw/before.rules

sudo sed 's/-A ufw-before-input -p icmp --icmp-type source-quench -j ACCEPT /#-A ufw-before-input -p icmp --icmp-type source-quench -j DROP/g' /etc/ufw/before.rules

sudo sed 's/-A ufw-before-input -p icmp --icmp-type time-exceeded -j ACCEPT /#-A ufw-before-input -p icmp --icmp-type time-exceeded -j DROP/g' /etc/ufw/before.rules

sudo sed 's/-A ufw-before-input -p icmp --icmp-type parameter-problem -j ACCEPT/ -A ufw-before-input -p icmp --icmp-type parameter-problem -j DROP/g' /etc/ufw/before.rules

sudo sed 's/-A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT/ -A ufw-before-input -p icmp --icmp-type echo-request -j DROP/g' /etc/ufw/before.rules

sudo sed 's/# enabled = true/enabled = true/g' /etc/fail2ban/jail.conf
sudo sed 's/# bantime = 1h/bantime = 1000h/g' /etc/fail2ban/jail.conf

#!/bin/bash

# ///////////////////////////////////////////////////////////////////////////
# //this is a script to update and configure Ubuntu for internet research///
# //to run me open terminal (CTRL ALT t) and type the below commands////
# 	chmod +x researchBox.sh
# 	sudo ./researchBox.sh
#///////////////////////////////////////////////////////////////////////////
# upadate system
sudo apt update && sudo apt upgrade -y && printf "\n\n	Upadated!\n\n"

# Firewall setup
sudo apt install ufw && sudo service ufw start && sudo systemctl enable ufw && sudo apt install fail2ban -y && sudo service fail2ban start && sudo systemctl enable fail2ban && printf "\n\n	Firewall set up!\n\n"

# Net-tools
sudo apt install net-tools -y && printf "\n\n	nnet tools installed!\n\n"

# MacChanger
sudo apt install macchanger -y && printf "\n\n	MAC Changer installed!\n\n"


# install gparted
sudo apt install gparted -y && printf "\n\n	Gparted installed!\n\n"

# remove home icon and trashcan
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false

# configure firefox to not allow tracking
cd ~/.mozilla/firefox/
cd `ls | grep *-release`
printf "//this script configures your firefox\n\
//browser to resist tracking and fingerprinting\n\
\n\
user_pref(\"privacy.firstparty.isolate\", true);\n\
user_pref(\"privacy.resistFingerprinting\", true);\n\
user_pref(\"browser.cache.offline.enable\", false);\n\
user_pref(\"browser.sessionstore.max_tabs_undo\", 0);\n\
user_pref(\"geo.enabled\", false);\n\
user_pref(\"media.navigator.enabled\", false);\n\
user_pref(\"network.cookie.cookieBehavior\", 1);\n\
user_pref(\"network.cookie.lifetimePolicy\", 2);\n\
user_pref(\"browser.send_pings\", false);\n\
user_pref(\"layout.css.visited_links\", false);\n\
user_pref(\"network.proxy.socks_remote_dns\", true);\n\
user_pref(\"network.dns.disablePrefetch\", true);\n" >> user.js
cd ~




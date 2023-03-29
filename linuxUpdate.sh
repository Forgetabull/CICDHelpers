#!/bin/bash
#sudo /opt/sophos-av/bin/savdctl disable
sudo systemctl stopsav-protect.service
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get autoremove
sudo apt --fix-broken install
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get update
sudo apt-get upgrade
#sudo /opt/sophos-av/bin/savdctl enable

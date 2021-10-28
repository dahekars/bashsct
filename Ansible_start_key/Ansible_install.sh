#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo apt install python3-pyqt5.QtSvg python3-pyqt5.qtwebsockets dynamips -y
sudo apt install ansible -y
wget "https://raw.githubusercontent.com/dahekars/bashsct/main/Ansible_start_key/install.yml" -O ~/PersonalProjects/install.yml -o ~/PersonalProjects/Downloadinglog.txt
ansible-playbook -u $USER -Kb ~/PersonalProjects/install.yml
rm -v ~/PersonalProjects/install.yml


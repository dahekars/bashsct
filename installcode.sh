#!/bin/bash
read -p "which package manager: " pkmg

install_tool(){
    # VScode
    sudo $pkmg install snapl
    sudo snap install --classic code # VScode 

    # Discord
    wget https://discord.com/api/download?platform=linux&format=deb  #downlaod Discord from web
    sudo $pkmg install ./discord.deb #start installing discord

    #terminator
    sudo $pkmg install terminator

    # XDM
    mkdir /tmp/XDM
    wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz 
    tar –xf xdm-setup-7.2.11.tar.xz
    sudo chmod -x install.sh
    sudo $pkmg install ./install.sh

    #ssh
    sudo $pkmg install openssh-server

    #VMBox install
    sudo $pkmg install virtualbox

    # VLC
    sudo $pkmg install vlc

    #microsoft Teams
    sudo $pkmg install teams

    #GNS 3
    sudo pip3 install gns3-server
    sudo pip3 install gns3-gui
    sudo apt install python3-pyqt5.QtSvg python3-pyqt5.qtwebsockets dynamips

    #chrome install
    mkdir /tmp/chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
    sudo $pkmg install ./google-chrome-stable_current_amd64.deb

    #John
    sudo $pkmg install john

    # Conda
    if [[$pkmg = "yum"]]; then #for ubuntu
        sudo $pkmg install libXcomposite libXcursor libXi libXtst libXrandr alsa-lib mesa-libEGL libXdamage mesa-libGL libXScrnSaver
    
    elif [[$pkmg = "apt"]]; then #for fedora
        sudo $pkmg install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

    mkdir /tmp/conda
    wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh 

    sha256sum Anaconda3-2021.05-Linux-x86_64.sh
    chmod +x Anaconda3-2021.05-Linux-x86_64.sh
    sudo $pkmg install ./Anaconda3-2020.02-Linux-x86_64.sh

    #Htop
    sudo $pkmg install htop

}

install_tool

echo $install_tool


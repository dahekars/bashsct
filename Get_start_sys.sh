#!/bin/bash

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# commandline tools
BLUE "Updating repositories..."
sudo apt update && sudo apt -y upgrade

BLUE "Snapd and Pip"
sudo apt install -y snapd 
sudo apt install python3-pip 
python3 -m pip install --upgrade pip

BLUE "Htop and Terminator"
sudo apt install -y htop terminator

BLUE "John the ripper"
sudo snap install john-the-ripper 

BLUE "VS code"
sudo snap install code --classic

BLUE "MS Teams"
sudo snap install teams

BLUE "Open SSH"
sudo apt install openssh-server -y


BLUE "Installing git..."
sudo apt install -y git

BLUE "Installing Sublime Text..." # according to https://www.sublimetext.com/docs/3/linux_repositories.html-
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

BLUE "Installing terminator..."
sudo apt install -y terminator

BLUE "Setting terminator as the default terminal emulator..."
sed -i s/Exec=gnome-terminal/Exec=terminator/g /usr/share/applications/gnome-terminal.desktop

BLUE "Forcing a color prompt in ~/.bashrc..."
grep "export PS1" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc
fi

BLUE "Installing task..."
sudo apt-get install -y taskwarrior

BLUE "Installing guake..."
sudo apt-get install -y guake

BLUE "Installing openvpn..."
sudo apt-get install -y openvpn

BLUE "Installing nmap..."
sudo apt-get install -y nmap

BLUE "Installing docker..."
sudo apt-get install -y docker.io
sudo groupadd docker
sudo usermod -aG docker `logname`

BLUE "Installing curl..."
sudo apt-get install -y curl

BLUE "Installing pinta..."
sudo apt-get install -y pinta

BLUE "Installing exiftool..."
sudo apt-get install -y exiftool

BLUE "Installing Python PIL..."
sudo apt-get install -y python-pil

BLUE "Installing sqlitebrowser..."
sudo apt-get install -y sqlitebrowser

BLUE "Installing Wireshark..."
sudo apt-get install -y wireshark

BLUE "Install Real VNC Viewer..."
mkdir -p ~/PersonalProjects/download/vnc_viewer && cd ~/PersonalProjects/download/vnc_viewer
wget "https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.17.1113-Linux-x64.deb" -O vnc_viewer.deb
dpkg -i vnc_viewer.deb
rm vnc_viewer.deb

BLUE "Install Real VNC Connect (Server)..."
mkdir -p ~/PersonalProjects/download/VNCserver && cd ~/PersonalProjects/download/VNCserver
wget 'https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.2.1-Linux-x64.deb' -O vnc_server.deb
dpkg -i vnc_server.deb
rm vnc_server.deb

BLUE "Adding VNC Connect (Server) service to the default startup /etc/rc.local..."
grep "vncserver-x11-serviced.service" /etc/rc.local
if [ $? -eq 1 ]
then
	echo "systemctl start vncserver-x11-serviced.service" >> ~/etc/rc.local
fi

BLUE "Installing Atom..."
mkdir -p ~/PersonalProjects/download/Atom && cp ~/PersonalProjects/download/Atom
wget "https://atom.io/download/deb" -O atom.deb
dpkg -i atom.deb
rm atom.deb

BLUE "Installing python-requests..."
pip install requests

BLUE "Installing idle..."
sudo apt install -y idle

BLUE "Installing xclip..."
sudo apt install -y xclip
grep "alias xclip" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "alias xclip='xclip -selection clipboard'" >> ~/.bashrc
fi

BLUE "Installing Python flask..."
sudo pip install flask

BLUE "Installing Python flask-login..."
sudo pip install flask-login

BLUE "Installing Python colorama..."
sudo pip install colorama

BLUE "Installing Python passlib..."
sudo pip install passlib

BLUE "Installing Spotify..."
sudo snap install spotify

BLUE "Installing Binwalk..."
sudo apt install -y binwalk

BLUE "Installing Tesseract..."
sudo apt install -y tesseract-ocr

BLUE "Installing foremost..."
sudo apt install -y foremost

BLUE "Installing rot13..."
sudo apt install -y bsdgames

BLUE "Installing hexedit..."
sudo apt install -y hexedit	

BLUE "Installing Python pwntools..."
sudo pip install pwntools

BLUE "Installing Go..."
sudo apt install -y golang-go
BLUE "Adding GOPATH and GOBIN to .bashrc, so future installs are easy.."
grep "export GOPATH" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export GOPATH=\$HOME/.go/" >> ~/.bashrc
fi
grep "export GOBIN" ~/.bashrc
if [ $? -eq 1 ]
then
	echo "export GOBIN=\$HOME/.go/bin" >> ~/.bashrc
	echo "export PATH=\$PATH:\$GOBIN" >> ~/.bashrc
fi

BLUE "Installing sqlite..."
sudo apt install -y sqlite	

BLUE "Installing nikto..."
sudo apt install -y nikto

BLUE "Installing zbarimg..."
sudo apt install -y zbar-tools	

BLUE "Installing qrencode..."
sudo apt install -y qrencode

BLUE "Installing pdfcrack..."
sudo apt install -y pdfcrack

BLUE "Installing Virtualbox..."
sudo apt install -y virtualbox-qt

BLUE "Installing Vagrant..."
sudo apt install -y vagrant

BLUE "Installing Hopper..."
mkdir -p ~/PersonalProjects/download/Hopper && cd ~/PersonalProjects/download/Hopper
wget "https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.3.14-Linux.deb"
dpkg -i Hopper-v4-4.3.14-Linux.deb
rm Hopper-v4-4.3.14-Linux.deb


BLUE "Installing Oracle Java 8..."
echo "" | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

BLUE "Downloading stegsolve.jar..."
mkdir -p ~/PersonalProjects/download/Stegsolve && cd ~/PersonalProjects/download/Stegsolve
wget "http://www.caesum.com/handbook/Stegsolve.jar" -O "stegsolve.jar"
chmod +x "stegsolve.jar"

BLUE "Installing fcrackzip..."
sudo apt install -y fcrackzip

BLUE "Installing unrar..."
sudo apt install -y unrar

BLUE "Installing steghide..."
sudo apt install -y steghide

BLUE "Installing ffmpeg..."
sudo apt install -y ffmpeg

BLUE "Installing Python library netifaces..."
sudo pip install netifaces

BLUE "Installing Python library iptools..."
sudo pip install iptools

BLUE "Installing Python library OpenSSL..."
sudo pip install pyopenssl

BLUE "Installing Python library pydispatch..."
sudo pip install pydispatch

BLUE "Installing GIMP..."
sudo apt install -y gimp

BLUE "Installing cmake..."
sudo apt install -y cmake

BLUE "Installing mplayer..."
sudo apt install -y mplayer


BLUE "Installing sshpass..."
sudo apt install -y sshpass

BLUE "Installing tcpflow..."
sudo apt install -y tcpflow

BLUE "Installing Python scapy..."
sudo pip install scapy

BLUE "Installing the thing that 7z2john.pl needs..."
sudo apt install libcompress-raw-lzma-perl 

BLUE "Installing dos2unix..."
sudo apt install libcompress-raw-lzma-perl

BLUE "AWSCLI"
mkdir -p ~/PersonalProjects/download/AWSCLI && sudo ~/PersonalProjects/download/AWSCLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
RED $(aws --version)

# applications
BLUE "VMbox"
sudo apt install virtualbox -y

BLUE "GNS3"
sudo apt install python3-pyqt5.QtSvg python3-pyqt5.qtwebsockets dynamips
sudo pip3 install gns3-server
sudo pip3 install gns3-gui

BLUE "Chrome"
YELLOW "Made folder for Chrome"
mkdir -p ~/PersonalProjects/download/Chrome && cd ~/PersonalProjects/download/Chrome
YELLOW "Downloading Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
YELLOW "Installing Chrome"
sudo apt install ./google-chrome-stable_current_amd64.deb -y
YELLOW "Removing Chrome"
rm google-chrome-stable_current_amd64.deb

BLUE "Anaconda"
YELLOW "Made folder for Anaconda"
mkdir -p ~/PersonalProjects/download/Anaconda && cd ~/PersonalProjects/download/Anaconda
YELLOW "Downloading Anaconda"
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh 
YELLOW "Installing Anaconda"
sha256sum Anaconda3-2021.05-Linux-x86_64.sh
chmod +x Anaconda3-2021.05-Linux-x86_64.sh    
sudo apt install ./Anaconda3-2020.02-Linux-x86_64.sh -y
YELLOW "Removing Anaconda"
rm Anaconda3-2020.02-Linux-x86_64.sh 

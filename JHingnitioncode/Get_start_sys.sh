#!/bin/bash

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}\n\n"
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
sudo apt install -y htop terminator adb

BLUE "John the ripper"
sudo snap install john-the-ripper 

BLUE "VS code"
sudo snap install code --classic

BLUE "MS Teams"
sudo snap install teams

BLUE "Open SSH"
sudo apt install openssh-server -y

while read -r p ; do sudo snap install $p ; done < <(cat << "EOF" 
teams
chromium
john-the-ripper 
discord
EOF
)


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

BLUE "Installing Dirb"
sudo apt-get install -y dirb

BLUE "Install Real VNC Viewer..."
mkdir -p -v~/PersonalProjects/download/vnc_viewer && cd ~/PersonalProjects/download/vnc_viewer
wget "https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.17.1113-Linux-x64.deb" -O vnc_viewer.deb
dpkg -i vnc_viewer.deb
rm vnc_viewer.deb

BLUE "Install Real VNC Connect (Server)..."
mkdir -p -v~/PersonalProjects/download/VNCserver && cd ~/PersonalProjects/download/VNCserver
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
mkdir -p -v~/PersonalProjects/download/Atom && cp ~/PersonalProjects/download/Atom
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
mkdir -p -v ~/PersonalProjects/download/Hopper && cd ~/PersonalProjects/download/Hopper
wget "https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.3.14-Linux.deb"
dpkg -i Hopper-v4-4.3.14-Linux.deb
rm Hopper-v4-4.3.14-Linux.deb


BLUE "Installing Oracle Java 8..."
echo "" | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

BLUE "Downloading stegsolve.jar..."
mkdir -p -v~/PersonalProjects/download/Stegsolve && cd ~/PersonalProjects/download/Stegsolve
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

BLUE "Installing Zap"
sudo snap install zaproxy --classic

BLUE "Installing ansible"
sudo apt install ansible -y

BLUE "AWSCLI"
mkdir -p -v ~/PersonalProjects/download/AWSCLI && sudo ~/PersonalProjects/download/AWSCLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
RED $(aws --version)

BLUE "Power shell"
sudo apt-get install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -o ~/PersonalProjects/opt/PWSH/powershell.deb
sudo dpkg -i ~/PersonalProjects/opt/PWSH/powershell.deb 
sudo apt-get update
sudo apt-get install -y powershell

# applications
BLUE "VMbox"
sudo apt install virtualbox -y

BLUE "GNS3"
sudo apt install python3-pyqt5.QtSvg python3-pyqt5.qtwebsockets dynamips
sudo pip3 install gns3-server
sudo pip3 install gns3-gui

BLUE "Chrome"
YELLOW "Made folder for Chrome"
mkdir -p -v ~/PersonalProjects/download/Chrome && cd ~/PersonalProjects/download/Chrome
YELLOW "Downloading Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
YELLOW "Installing Chrome"
sudo apt install ./google-chrome-stable_current_amd64.deb -y
YELLOW "Removing Chrome"
rm google-chrome-stable_current_amd64.deb

BLUE "Anaconda"
YELLOW "Made folder for Anaconda"
mkdir -p -v ~/PersonalProjects/download/Anaconda && cd ~/PersonalProjects/download/Anaconda
YELLOW "Downloading Anaconda"
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh 
YELLOW "Installing Anaconda"
sha256sum Anaconda3-2021.05-Linux-x86_64.sh
chmod +x Anaconda3-2021.05-Linux-x86_64.sh    
sudo apt install ./Anaconda3-2020.02-Linux-x86_64.sh -y
YELLOW "Removing Anaconda"
rm Anaconda3-2020.02-Linux-x86_64.sh 

BLUE "Creating update file"
echo "sudo apt-get update && sudo apt-get upgrade" >> /usr/bin/update

BLUE "Masscan"
mkdir -p -v ~/PersonalProjects/opt/Masscan && cd ~/PersonalProjects/opt/Masscan
sudo apt-get --assume-yes install git make gcc
git clone https://github.com/robertdavidgraham/masscan ~/PersonalProjects/opt/Masscan
cd masscan
make

BLUE "Sublist3r"
mkdir -p -v ~/PersonalProjects/opt/Sublist3r && cd ~/PersonalProjects/opt/Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git
sudo pip install -r requirements.txt

BLUE "Seclist"
mkdir -p -v ~/PersonalProjects/opt/Seclist && cd ~/PersonalProjects/opt/Seclist
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip 
unzip SecList.zip 
rm -f SecList.zip

BLUE "Linpeas"
mkdir -p -v ~/PersonalProjects/opt/Linpeas && cd ~/PersonalProjects/opt/Linpeas
wget "https://github.com/carlospolop/PEASS-ng/blob/master/linPEAS/linpeas.sh" -o linpeas.sh
chmod +x linpeas.sh

BLUE "Massdns"
mkdir -p -v ~/PersonalProjects/opt/Massdns && cd ~/PersonalProjects/opt/Massdns
git clone https://github.com/blechschmidt/massdns.git ~/PersonalProjects/opt/Massdns
make

BLUE "FFuF"
sudo apt-get install -y ffuf

BLUE "Wafwoof"
sudo apt install wafw00f

BLUE "Downloading Dirbuster"
wget "https://liquidtelecom.dl.sourceforge.net/project/dirbuster/DirBuster%20%28jar%20%2B%20lists%29/1.0-RC1/DirBuster-1.0-RC1.zip" -o ~/PersonalProjects/opt/DirBuster.zip
cd ~/PersonalProjects/opt/DirBuster && unzip ~/PersonalProjects/opt/DirBuster.zip

BLUE "Steam"
sudo apt install steam -y

RED "PIP modules installation"

BLUE "pip modules pyOpenSSL"
pip install pyOpenSSL
BLUE "pip modules opencv"
pip install opencv-python 
BLUE "pip modules touch"
pip install torch
BLUE "pip modules pygame"
pip install pygame
BLUE "pip modules pandas"
pip install pandas
BLUE "pip modules pandas datareader"
pip install pandas-datareader
BLUE "pip modules SpeechRecognition"
pip install SpeechRecognition
BLUE "pip modules Smartapi"
pip install SmartAPI
BLUE "pip modules Beautifullsoup"
pip install beautifulsoup4
BLUE "pip modules cmake"
pip install cmake
BLUE "pip modules Jinja2"
pip install Jinja2
BLUE "pip modules fastapi"
pip install fastapi
BLUE "pip modules ipython"
pip install ipython
BLUE "pip modules gym"
pip install gym
BLUE "pip modules tabulate"
pip install tabulate
BLUE "pip modules Twisted"
pip install Twisted
BLUE "pip modules urllib3"
pip install urllib3
BLUE "pip modules wheel"
pip install wheel
BLUE "pip modules uvicorn"
pip install uvicorn
BLUE "pip modules pyOpenSSL"
pip install pyOpenSSL
BLUE "pip modules matplotlib"
pip install matplotlib
BLUE "pip modules gtts"
pip install gtts
BLUE "pip modules blinker"
pip install blinker
BLUE "pip modules pytube"
pip install pytube
BLUE "pip modules tensorflow"
pip install tensorflow
BLUE "pip modules speedtest-cli"
pip install speedtest-cli
BLUE "pip modules discord.py"
pip install discord.py

RED "Git repository"

BLUE "Github repository Ai_snake"
git clone https://github.com/dahekars/Ai_snake.git ~/PersonalProjects/code/Ai_snake
BLUE "Github repository Angel_bot"
git clone https://github.com/dahekars/Angel_bot.git ~/PersonalProjects/code/Angel_bot
BLUE "Github repository YTD"
git clone https://github.com/dahekars/YTD-Youtubedownloader.git ~/PersonalProjects/code/YTD-Youtubedownloader
BLUE "Github repository Snakegame"
git clone https://github.com/dahekars/snakegame.git ~/PersonalProjects/code/Snakegame
BLUE "Github repository Tetris"
git clone https://github.com/dahekars/Tetris ~/PersonalProjects/code/Tetris
BLUE "Github repository Netspeedtest"
git clone https://github.com/dahekars/Netspeedtest.git ~/PersonalProjects/code/Netspeedtest
# BLUE "Github repository UE"
# git clone https://github.com/EpicGames/UnrealEngine.git --branch=4.22 ~/PersonalProjects/code/UE

BLUE "Github repository Sublist3r"

https://github.com/aboul3la/Sublist3r.git ~/PersonalProjects/opt/Sublist3r
sudo apt-get install python-requests
cd ~/PersonalProjects/opt/Sublist3 && pip install -r requirements.txt

BLUE "Github repository Striker"

https://github.com/s0md3v/Striker.git ~/PersonalProjects/opt/Striker
pip install -r ~/PersonalProjects/opt/Striker/repository.txt

BLUE "Remmina"
sudo apt-get install -y remmina

GREEN """

now remaining to Downloading and installing
1. Burt Suite 'https://portswigger.net/burp/releases/community/latest'
2. OWAPS ZAP 'https://www.zaproxy.org/download/'
3. XDM 'https://xtremedownloadmanager.com/'
4. Discord 'https://discord.com/download'

"""


while read -r p ; do sudo snap install $p --classic; done < <(cat << "EOF" 
zaproxy 
code 
go 
android-studio
EOF
)



while read -r p ; do go get -u $p ; done < <(cat << "EOF"
github.com/tomnomnom/assetfinder
github.com/tomnomnom/meg
github.com/tomnomnom/waybackurls
github.com/tomnomnom/httprobe
github.com/tomnomnom/anew
github.com/tomnomnom/fff
github.com/ffuf/ffuf
EOF
)



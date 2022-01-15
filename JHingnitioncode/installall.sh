#!/bin/bash

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

BLUE "updating all repo"
echo "" | sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update && sudo apt-get upgrade -y

RED 'installing the nice-to-have pre-requisites'
RED 'you have 3 seconds to proceed ...'
RED 'or'
RED 'hit Ctrl+C to quit'
echo -e "\n"
sleep 4

GREEN "starting install tools"
set -eu -o pipefail # fail on error and report it, debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

while read -r p ; do sudo apt install -y $p ; done < <(cat << "EOF" 
snapd 
python3-pip
htop 
terminator
git
idle
xclip
binwalk
tesseract-ocr
foremost
bsdgames
hexedit	
sqlite	
nikto
zbar-tools	
qrencode
pdfcrack
virtualbox-qt
vagrant
fcrackzip
unrar
steghide
ffmpeg
gimp
cmake
mplayer
sshpass
tcpflow
apt-transport-https
taskwarrior
guake
openvpn
nmap
docker.io
curl
pinta
exiftool
python-pil
sqlitebrowser
wireshark
dirb
openssh-server
wget 
software-properties-common
remmina
EOF
)

GREEN "starting install PIP tools"

while read -r p ; do pip install $p ; done < <(cat << "EOF" 
requests
flask
flask-login
colorama
passlib
pwntools
netifaces
iptools
pyopenssl
pydispatch
scapy
pyOpenSSL
opencv-python 
pygame
pandas
pandas-datareader
SpeechRecognition
SmartAPI
beautifulsoup4
cmake
Jinja2
fastapi
ipython
gym
tabulate
Twisted
urllib3
wheel
uvicorn
pyOpenSSL
matplotlib
gtts
blinker
pytube
tensorflow
speedtest-cli
discord.py
EOF
)

GREEN "starting install snap files"

while read -r p ; do sudo snap install $p ; done < <(cat << "EOF" 
zaproxy --classic
teams
chromium
code --classic
john-the-ripper 
discord
go --classic
EOF
)

while read -r p; do sudo git clone $p; done < <(cat << "EOF"
https://github.com/robertdavidgraham/masscan ~/PersonalProjects/opt/Masscan
https://github.com/aboul3la/Sublist3r.git ~/PersonalProjects/opt/Sublist3r
https://github.com/blechschmidt/massdns.git ~/PersonalProjects/opt/Massdns
https://github.com/dahekars/Ai_snake.git ~/PersonalProjects/code/Ai_snake
https://github.com/dahekars/YTD-Youtubedownloader.git ~/PersonalProjects/code/YTD-Youtubedownloader
https://github.com/dahekars/snakegame.git ~/PersonalProjects/code/Snakegame
https://github.com/dahekars/Tetris ~/PersonalProjects/code/Tetris
https://github.com/dahekars/Netspeedtest.git ~/PersonalProjects/code/Netspeedtest
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

sudo cp ~/go/bin/* /usr/bin/

BLUE "Chrome"
mkdir -p -v ~/PersonalProjects/download/Chrome && cd ~/PersonalProjects/download/Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm google-chrome-stable_current_amd64.deb

while read -r p ; do wget $p ; done < <(cat << "EOF"
https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-6.17.1113-Linux-x64.deb
https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.2.1-Linux-x64.deb
https://atom.io/download/deb -O atom.deb
https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-4.3.14-Linux.deb
-q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -o powershell.deb
EOF
)

while read -r p ; do sudo dpkg -i $p  ; done < <(cat << "EOF"
VNC-Viewer-6.17.1113-Linux-x64.deb
VNC-Server-6.2.1-Linux-x64.deb
atom.deb
Hopper-v4-4.3.14-Linux.deb
powershell.deb
EOF
)

rm *.deb

firefox "https://portswigger.net/burp/releases/community/latest" "https://xtremedownloadmanager.com/"
#!/bin/bash

if [[ "$(id -u)" -ne 0 ]]; then
   printf "\e[1;91m Run this program as root!\n\e[0m"
   exit 1
fi

#creating directory to install tools
mkdir -p tools
cd tools
source ~/.bash_profile


    apt-get -y install python python3 python-pip python3-pip

#install go lang
  wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
        sudo tar -xvf go1.13.4.linux-amd64.tar.gz
        sudo mv go /usr/local
        export GOROOT=/usr/local/go
        export GOPATH=$HOME/go
        export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
        echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
        echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile
        echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
        source ~/.bash_profile
        rm go1.13.4.linux-amd64.tar.gz

#install curl
    apt-get -y install curl

    apt-get -y install jq

    apt-get -y install sed

    go get -u github.com/tomnomnom/httprobe

    go get github.com/tomnomnom/waybackurls

    apt-get -y install nmap


echo -e "\n\e[1;92m installing dirsearch \e[0m"
git clone https://github.com/maurosoria/dirsearch.git
echo -e "\n\e[1;92m done \e[0m"

echo -e "\n\e[1;92m installing LinkFinder \e[0m"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
python setup.py install
cd ../
echo -e "\n\e[1;92m done \e[0m"


echo -e "\n\e[1;92m installing subbrute \e[0m"
git clone https://github.com/TheRook/subbrute
echo -e "\n\e[1;92m done \e[0m"

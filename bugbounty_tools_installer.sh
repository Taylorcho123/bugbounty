#!/usr/bin/env bash

TOOLS="$HOME/bounty/tools";

#기본환경 구성
sudo apt-get update;
sudo apt-get install unzip git wget curl nmap masscan nikto whatweb wafw00f chromium-browser python-pip python3-pip p7zip-full -y;

mkdir -pv "$HOME"/bounty/tools;

# go 언어설치
wget -nv https://dl.google.com/go/go1.13.6.linux-amd64.tar.gz;
sudo tar -C /usr/local -xzf go1.13.6.linux-amd64.tar.gz;
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:" >> "$HOME"/.profile;
echo "export GOPATH=$HOME/go" >> "$HOME"/.profile;
source "$HOME"/.profile;
rm -rf go1.13.6.linux-amd64.tar.gz;

# amass 설치
wget -nv https://github.com/OWASP/Amass/releases/download/v3.4.2/amass_v3.4.2_linux_amd64.zip -O "$TOOLS"/amass.zip;
unzip -j  "$TOOLS"/amass.zip -d "$TOOLS"/amass;
rm "$TOOLS"/amass.zip;

# subfinder 설치
wget -nv https://github.com/projectdiscovery/subfinder/releases/download/v2.3.0/subfinder-linux-amd64.tar -O "$TOOLS"/subfinder.tar;
tar xf   -d "$TOOLS"/subfinder;
sudo tar -C "$TOOLS"/subfinder-xzf "$TOOLS"/subfinder.tar;
mv "$TOOLS"/subfinder-linux-amd64 "$TOOLS"/subfinder
rm "$TOOLS"/subfinder.tar;

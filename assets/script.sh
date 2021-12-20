#!/bin/bash
echo "- start install script -"

curl -o install.sh https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh
bash install.sh --accept-all-defaults

# python, pip & jupyter dependencies
sudo apt-get update -y
sudo apt install -y python3 python3-pip python3-dev curl
sudo apt-get install -y python3-setuptools
pip3 install -U pip setuptools 
pip3 install oci

export PATH=$PATH:~/.local/bin
source ~/.bashrc

echo "- finish install script -"
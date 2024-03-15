#!/bin/bash
#The installation will run into 2 phases, the first phase will install Kali terminal, when the installation finishes, type "exit" then you will see Phase-2 started to install Mini-Conda! 
sudo apt update && sudo apt upgrade -y
sudo apt install python3 python3-pip python3-full git curl glances gpg -y
sudo apt install zsh -y
sudo apt install zsh-syntax-highlighting zsh-autosuggestions -y
sudo apt install qterminal fonts-firacode gnome-tweaks -y
chsh -s /bin/zsh
curl -o ~/.zshrc https://raw.githubusercontent.com/Ahmed-Sabri/kali-terminal-in-ubuntu/main/.zshrc
source .zshrc
. .zshrc
git clone https://github.com/linuxopsys/ubuntu-to-kali-terminal.git && cd ubuntu-to-kali-terminal
tar -xvf color-schemes.tar
tar -xvf kali-dark-theme.tar
sudo rm -rf /usr/share/qtermwidget5
sudo mv -f usr/share/qtermwidget5 /usr/share
sudo mv -f usr/share/themes/Kali-Dark /usr/share/themes
zsh
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh
exit

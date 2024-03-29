#!/bin/bash
#The installation will run into 2 phases, the first phase will install Kali terminal, when the installation finishes, type "exit" then you will see Phase-2 started to install Mini-Conda! 
######################################
## Phase-1 | Install Kali Terminal
######################################
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
######################################
## Phase-1.2 | Install NodeJS V21
######################################
apt purge nodejs -y
apt remove nodejs -y
apt autoremove -y
apt update && apt full-upgrade -y
apt install -y ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_21.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt update && apt full-upgrade -y
apt install nodejs -y
######################################
## Phase-2 | Install Miniconda 
######################################
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh
exit

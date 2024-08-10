#!/bin/bash
#The installation will run into 2 phases, the first phase will install Kali terminal, when the installation finishes, type "exit" then you will see Phase-2 started to install Mini-Conda! 
##############################################################
## Phase-1 | Install Kali Terminal ||. "$HOME/.cargo/env"
###############################################################
sudo apt update && sudo apt full-upgrade -y
sudo apt install python3 python3-pip python3-full git curl glances gpg golang-go rustc cmdtest ca-certificates btop ffmpeg yt-dlp python3-apport python3-problem-report -y

curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.local/bin:$PATH"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.zshrc     
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew install gcc

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
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt-get install nodejs -y
pip install --upgrade --no-cache npm open-interpreter pip pipx pytube setuptools-rust aider-chat rawdog-ai crawlee 'crawlee[beautifulsoup,playwright]' 'crawlee[curl-impersonate]' 'crawlee[playwright]' curl_cffi pollinations openrouter-sdk openai faster-whisper mem0ai
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
install git+https://github.com/openai/whisper.git
playwright install
npm install pnpm
######################################
## Phase-1.3 | Install Docker
######################################
# Add Docker's official GPG key:

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin -y

######################################
## Phase-1.4 | Install PIPX
######################################
python3 -m pip install --user pipx
python3 -m pipx ensurepath
sudo pipx ensurepath

######################################
## Phase-2 | Install Miniconda 
######################################
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init zsh


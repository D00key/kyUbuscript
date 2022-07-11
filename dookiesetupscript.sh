#! /bin/bash
mkdir .dookscript
cd .dookscript || exit
sudo apt-get install apparmor-* net-tools git apt-transport-https cmatrix neofetch firejail-* curl -y
sudo apt-get purge apparmor-notify -y --autoremove
wget --https-only https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
sudo dpkg -i 1password-latest.deb
wget --https-only https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get --fix-broken install -y && sudo apt install brave-browser -y && sudo aa-enfore /etc/apparmor.d/* && sudo firecfg
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

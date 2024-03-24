#!/bin/bash

# Dependencies installation
# oh-my-zsh
rm -rf ~/.oh-my-zsh
(zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | bash -s /usr/local/bin

sudo apt-get update
sudo apt-get install fzf -y
sudo apt-get install ranger -y
sudo apt-get install lynx -y
sudo apt-get install emacs -y

# Install Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# Link config files
current_directory=$(pwd)
rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.config/nvim
rm ~/.config/doom

ln -s $current_directory/.tmux.conf ~/.tmux.conf
ln -s $current_directory/.zshrc ~/.zshrc
ln -s $current_directory/nvim ~/.config/nvim
ln -s $current_directory/doom ~/.config/doom
echo "Linked config files"

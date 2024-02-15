#!/bin/bash

# Dependencies installation
# oh-my-zsh
rm -rf ~/.oh-my-zsh
(zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo apt-get update
sudo apt-get install fzf -y
sudo apt install ranger -y

# Link config files
current_directory=$(pwd)
rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.config/nvim

ln -s $current_directory/.tmux.conf ~/.tmux.conf
ln -s $current_directory/.zshrc ~/.zshrc
ln -s $current_directory/nvim ~/.config/nvim
echo "Linked config files"
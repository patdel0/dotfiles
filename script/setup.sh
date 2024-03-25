#!/bin/bash

# Dependencies installation
sudo apt-get update
sudo apt-get install curl fzf ranger nyxt emacs neovim flatpak -y

# oh-my-zsh
rm -rf ~/.oh-my-zsh
(zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | bash -s /usr/local/bin


# Install Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# Link config files
current_directory=$(pwd)
rm ~/.tmux.conf
rm ~/.zshrc
rm -rf ~/.config/nvim
rm -rf ~/.config/doom

ln -s $current_directory/.tmux.conf ~/.tmux.conf
ln -s $current_directory/.zshrc ~/.zshrc
ln -s $current_directory/nvim ~/.config/nvim
ln -s $current_directory/doom ~/.config/doom
echo "Linked config files"

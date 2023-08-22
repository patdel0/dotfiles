#!/bin/bash
current_directory=$(pwd)

ln -s $current_directory/.tmux.conf ~/.tmux.conf
ln -s $current_directory/.zshrc ~/.zshrc
ln -s $current_directory/nvim ~/.config/nvim

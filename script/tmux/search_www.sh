#!/bin/bash

read -p "Enter search term: " search_term

formatted_term=$(echo "$search_term" | sed 's/ /+/g')

tmux new-window -n "$search_term" "lynx -accept_all_cookies 'https://duckduckgo.com/lite?q=$formatted_term'"

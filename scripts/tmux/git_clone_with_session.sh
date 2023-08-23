#!/bin/bash
source $(dirname $0)/project_cache_manager.sh

default_directory="$HOME/code/github.com"

prompt_for_git_url() {
	echo "Enter the Git repository URL:"
	read git_url
}

extract_repo_name() {
	repo_name=$(basename $git_url .git)
}

create_clone_directory() {
	clone_directory="${default_directory}/${repo_name}"
	mkdir -p $clone_directory
}

clone_git_repo() {
	git clone $git_url $clone_directory
}

add_repo_to_cache() {
	add_to_cache_file $clone_directory
}

create_session() {
	tmux new-session -d -c $clone_directory -s $repo_name 'nvim -c ":Telescope find_file"'
}

switch_session() {
	tmux switch-client -t $repo_name
}

main() {
	prompt_for_git_url
	extract_repo_name
	create_clone_directory
	clone_git_repo
	add_repo_to_cache
	create_session
	switch_session
}

main

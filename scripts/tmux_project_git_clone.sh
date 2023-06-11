#!/bin/bash
source $(dirname $0)/tmux_project_cache_manager.sh

default_directory="$HOME/code/github.com"
prompt_for_git_url() {
    echo "Enter the Git repository URL:"
    read git_url
}

extract_repo_name() {
    # Extract the repository name from the Git URL
    repo_name=$(basename $git_url .git)
}

define_clone_directory() {
    clone_directory="${default_directory}/${repo_name}"
}

ensure_clone_directory_exists() {
    mkdir -p $clone_directory
}

clone_git_repo() {
    git clone $git_url $clone_directory
}

add_repo_to_cache() {
    add_to_cache_file $clone_directory
}

create_and_switch_tmux_session() {
    tmux new-session -d -c $clone_directory -s $repo_name 'nvim -c ":Telescope find_file"'
    tmux switch-client -t $repo_name
}

main() {
    prompt_for_git_url
    extract_repo_name
    define_clone_directory
    ensure_clone_directory_exists
    clone_git_repo
    add_repo_to_cache
    create_and_switch_tmux_session
}

main

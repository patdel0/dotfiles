#!/bin/bash

cache_file="$HOME/.git_repo_cache"

create_cache_file() {
    # Find all git repositories in ~/code and its children
    git_repos=$(find ~/code -type d -exec test -e '{}/.git' ';' -prune -print)
    echo "${git_repos}" > "${cache_file}"
}

read_cache_file() {
    git_repos=$(cat "${cache_file}")
}

select_repo() {
    # Select a git repository using fzf [fuzzy find]
    selected_repo=$(echo "${git_repos}" | fzf)
}

check_selection() {
    # Check if a repository was selected
    if [ -z "${selected_repo}" ]; then
        echo "No repository selected, exiting."
        exit 1
    fi
}

get_repo_name() {
    # Extract the repository name from the selected repository path
    repo_name=$(basename "${selected_repo}")
}

manage_tmux_session() {
    # Check if a session with the same name as the repository already exists
    if tmux has-session -t "${repo_name}" 2>/dev/null; then
        tmux switch-client -t "${repo_name}"
    else
        tmux new-session -d -s "${repo_name}" "cd ${selected_repo} && nvim"
        tmux switch-client -t "${repo_name}"
    fi
}

main() {
    # Check if the cache file exists, if not, create it
    if [ ! -f "${cache_file}" ]; then
        create_cache_file
    else
        read_cache_file
    fi

    select_repo
    check_selection
    get_repo_name
    manage_tmux_session
}

main

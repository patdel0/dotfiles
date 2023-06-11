#!/bin/bash
source $(dirname $0)/tmux_project_cache_manager.sh

select_repo() {
    # Select a git repository using fzf [fuzzy find]
    selected_repo=$(read_cache_file | fzf)
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
        tmux new-session -d -c "${selected_repo}" -s "${repo_name}" "nvim"
        tmux switch-client -t "${repo_name}"
    fi
}

main() {
    if [ ! -f "${cache_file}" ]; then
        create_cache_file
    fi

    select_repo
    check_selection
    get_repo_name
    manage_tmux_session
}

main

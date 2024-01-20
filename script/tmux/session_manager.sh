#!/bin/bash
source $(dirname $0)/cache_manager.sh

select_repo() {
	selected_repo_name=$(read_cache_file | fzf)
}

check_selection() {
	if [ -z "${selected_repo_name}" ]; then
		echo "No repository selected, exiting."
		exit 1
	fi
}

get_repo_name() {
	repo_name=$(basename "${selected_repo_name}")
}

manage_session() {
	if [ -z "${selected_repo_name}" ]; then
		echo "No repository selected, exiting."
		exit 1
	fi

	repo_path="$HOME/code/github.com/${selected_repo_name}"

	if ! tmux has-session -t "${selected_repo_name}" 2>/dev/null; then
		tmux new-session -d -c "${repo_path}" -s "${selected_repo_name}" "nvim"
		tmux new-window -t "${selected_repo_name}:1" -n "zsh"
	fi
	tmux switch-client -t "${selected_repo_name}"
}

main() {

	echo "main"
	if [ ! -f "${cache_file}" ]; then
		create_cache_file
	fi

	select_repo
	check_selection
	get_repo_name
	manage_session
}

main

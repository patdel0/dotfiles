#!/bin/bash
source $(dirname $0)/project_cache_manager.sh

select_repo() {
	selected_repo=$(read_cache_file | fzf)
}

check_selection() {
	if [ -z "${selected_repo}" ]; then
		echo "No repository selected, exiting."
		exit 1
	fi
}

get_repo_name() {
	repo_name=$(basename "${selected_repo}")
}

manage_tmux_session() {
	if ! tmux has-session -t "${repo_name}" 2>/dev/null; then
		tmux new-session -d -c "${selected_repo}" -s "${repo_name}" "nvim"
	fi
	tmux switch-client -t "${repo_name}"
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

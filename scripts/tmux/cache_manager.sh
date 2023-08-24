#!/bin/bash

cache_file="$HOME/.git_repo_cache"

create_cache_file() {
	# Find all git repositories in ~/code and its children
	git_repos=$(find ~/code/github.com/ -type d -exec test -e "{}"/.git ';' -prune -print)
	echo "${git_repos}" >"${cache_file}"
}

clean_cache_file() {
	>"${cache_file}"
	create_cache_file
}

read_cache_file() {
	cat "${cache_file}"
}

add_to_cache_file() {
	echo "${1}" >>"${cache_file}"
}

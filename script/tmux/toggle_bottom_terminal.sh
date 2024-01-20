#!/bin/bash

# Pane title for identification
pane_title="TogglePane"

# Function to toggle pane visibility
toggle_pane() {
	# Find the pane with the specific title
	pane_id=$(tmux list-panes -F '#{pane_id} #{pane_title}' | grep "$pane_title" | cut -d ' ' -f 1)

	if [ -n "$pane_id" ]; then
		# Check if the pane is hidden
		if tmux list-panes -F '#{pane_id} #{pane_hidden}' | grep -q "$pane_id 1"; then
			# Pane is hidden, unhide it
			tmux resize-pane -Z -t "$pane_id"
			tmux select-pane -t "$pane_id"
		else
			# Pane is visible, hide it
			tmux resize-pane -Z -t "$pane_id"
		fi
	else
		# Pane does not exist, create it with the specific title
		tmux split-window -v -p 20
		tmux select-pane -T "$pane_title"
	fi
}

# Call the function
toggle_pane

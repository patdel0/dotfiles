   #!/bin/bash

   # Check if the repository URL is provided
   if [ -z "\$1" ]; then
       echo "Usage: tgc <repository_url>"
       exit 1
   fi

   # Clone the repository
   git clone "\$1"
   repo_name=$(basename "\$1" .git)

   # Check if the repository was cloned successfully
   if [ ! -d "$repo_name" ]; then
       echo "Error: Failed to clone the repository"
       exit 1
   fi

   # Change to the repository directory
   cd "$repo_name" || exit

   # Create a new tmux session and attach to it
   tmux new-session -s "$repo_name"


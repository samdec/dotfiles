#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Set my editor and git editor
export EDITOR="vim"
export GIT_EDITOR="vim"

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=/usr/local/bin:$PATH

# PollEv Utility
export PATH="$HOME/.pollev/bin:$PATH"

# Load Bash It
source $BASH_IT/bash_it.sh

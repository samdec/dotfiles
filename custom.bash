# Fill in options when tab completing
bind '"\t":menu-complete'

# Use Silver Searcher for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--no-mouse'

# Initialize rbenv
eval "$(rbenv init -)"

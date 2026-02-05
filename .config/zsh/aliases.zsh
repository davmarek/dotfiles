# Aliases
alias c='clear'
alias ls='ls --color'

if type eza &>/dev/null; then
	alias ll='eza --long --header --sort=type --no-user --time-style="+%d-%m-%Y %H:%M"'
	alias la='eza --long --header --sort=type --no-user --time-style="+%d-%m-%Y %H:%M" --all'
else
	alias ll='ls -l -F'
	alias la='ls -l -F -A'
fi

if type nvim &>/dev/null; then
  alias nivm="nvim"
  # alias vim="nvim"
  # alias v="nvim"
fi

alias rmnm='rm -rf node_modules'
alias gfop='git fetch origin -pP'
alias lg='lazygit'
alias newvenv="python3 -m venv .venv && source .venv/bin/activate"

# Inspired by Dreams of Autonomy: https://www.youtube.com/watch?v=ud7YxC33Z3w


# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light mfaerevaag/wd

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::dotnet

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Load Starship prompt
eval "$(starship init zsh)"


# Keybindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias c='clear'
alias ls='ls --color'
alias ll='eza --long --header --sort=type --no-user --time-style="+%d-%m-%Y %H:%M"'
alias la='eza --long --header --sort=type --no-user --time-style="+%d-%m-%Y %H:%M" --all'
alias rmnm='rm -rf node_modules'
alias gfop='git fetch origin -pP'
alias fcd='cd $(find . -type d | fzf | (read dir && [ -n "$dir" ] && dirname "$dir" || echo "$PWD"))'
alias lg='lazygit'
alias newvenv="python3 -m venv .venv && source .venv/bin/activate"

# Shell integrations
if type "zoxide" > /dev/null; then
  eval "$(zoxide init zsh)"
fi

if type "fzf" > /dev/null; then
  source <(fzf --zsh)
fi


# Disable Homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

# Add homebrew Node.js 22 to PATH
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# Herd injected PHP binary.
export PATH="/Users/davidmarek/Library/Application Support/Herd/bin/":$PATH
# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/davidmarek/Library/Application Support/Herd/config/php/82/"
# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/davidmarek/Library/Application Support/Herd/config/php/81/"
# Herd injected NVM configuration
export NVM_DIR="/Users/davidmarek/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


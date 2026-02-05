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

# macOS-only: restore native zsh help command (macOS aliases it to 'man' by default)
if [[ "$OSTYPE" == "darwin"* ]]; then
  unalias run-help 2>/dev/null
  autoload -Uz run-help

  # Disable Homebrew auto-update
  export HOMEBREW_NO_AUTO_UPDATE=1
fi


source "$HOME/.config/zsh/history.zsh"
source "$HOME/.config/zsh/completions.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/path.zsh"
source "$HOME/.config/zsh/functions.zsh"

# Load Starship prompt
eval "$(starship init zsh)"

# Shell integrations
if type "zoxide" > /dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if type "fzf" > /dev/null 2>&1; then
  source <(fzf --zsh)
fi

if type "uv" > /dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"


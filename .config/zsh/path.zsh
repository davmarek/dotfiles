# tmux-sessionizer
export PATH="$PATH":"$HOME/.local/bin"
# bind Ctrl+f to run tmux-sessionizer
bindkey -s ^f "tmux-sessionizer\n"

# homebrew Node.js 22
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# dotnet tools
export PATH="$HOME/.dotnet/tools:$PATH"

# GOPATH
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Herd injected PHP binary.
export PATH="/Users/davidmarek/Library/Application Support/Herd/bin/":$PATH
# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/davidmarek/Library/Application Support/Herd/config/php/84/"
# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/davidmarek/Library/Application Support/Herd/config/php/83/"
# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/davidmarek/Library/Application Support/Herd/config/php/82/"

# bun completions
[ -s "/Users/davidmarek/.bun/_bun" ] && source "/Users/davidmarek/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Antigravity
export PATH="/Users/davidmarek/.antigravity/antigravity/bin:$PATH"

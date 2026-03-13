# Environment
export HISTCONTROL=ignoredups
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_FROM_API=1
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$PATH:/Applications/Obsidian.app/Contents/MacOS"

# Source .bashrc for interactive settings
[ -f ~/.bashrc ] && source ~/.bashrc

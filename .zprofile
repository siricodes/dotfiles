# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

# Set ZSH-related variables
export ZDOTDIR={$XDG_CONFIG_HOME}

# ZSHRC
# Options
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
# Aliases
autoload -Uz compinit && compinit
source $ZDOTDIR/alias/aliasrc
# Plugins
source $ZDOTDIR/.zinitrc


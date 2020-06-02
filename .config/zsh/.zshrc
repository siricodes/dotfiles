# ZSHRC
# Options
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
# Aliases
autoload -Uz compinit && compinit
source $XDG_DATA_HOME/alias/aliasrc
# Prompt
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# Plugins
### Added by Zinit's installer
if [[ ! -f $ZDOTDIR/zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/zsh/zinit" && command chmod g-rwX "$HOME/.config/zsh/zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.config/zsh/zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$ZDOTDIR/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node
zinit ice pick"async.zsh" src"lambda-pure.zsh"
zinit light marszall87/lambda-pure
# fast completions
zinit wait lucid for \
	 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
	     zdharma/fast-syntax-highlighting \
	      blockf \
	          zsh-users/zsh-completions \
		   atload"!_zsh_autosuggest_start" \
		       zsh-users/zsh-autosuggestions

### End of Zinit's installer chunk
## Syntax Highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

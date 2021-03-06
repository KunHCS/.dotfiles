# Enable colors vcs_info and change prompt:
# https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' (%b)'
precmd() {
    vcs_info
    NEWLINE=$'\n'
    PROMPT="%n%F{green}@%f%m %F{blue}%3~%f%F{cyan}${vcs_info_msg_0_}%f${NEWLINE}%# "
}

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

# Custom Variables
EDITOR=vim

# Autosuggestion Options
bindkey '^ ' autosuggest-accept
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858,underline"

# Syntax Highlighting Options
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[globbing]='none'

fpath=("$HOME/.zsh/completion" $fpath)

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


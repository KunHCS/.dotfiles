#!/bin/bash
# Enable colors vcs_info and change prompt:
# https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
if [ -z "$ZDOTDIR" ] ; then
  echo "ZDOTDIR not set"
  ZDOTDIR=$HOME/.config/zsh
fi
autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' (%b)'
precmd() {
    vcs_info
    NEWLINE=$'\n'
    PROMPT="%F{green}%n@%m%f %F{blue}%3~%f%F{cyan}${vcs_info_msg_0_}%f${NEWLINE}%# "
}

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/.zsh_history
setopt appendhistory

# Set editor
if command -v nvim > /dev/null 2>&1; then
    VISUAL=nvim
else
    VISUAL=vim
fi
export VISUAL
export EDITOR=$VISUAL
alias vim=$EDITOR

# Autosuggestion Options
bindkey '^ ' autosuggest-accept

# Syntax Highlighting Options
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[globbing]='none'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858,underline"

# Basic auto/tab complete:
fpath=("$HOME/.zsh/completion" $fpath)
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$ZDOTDIR/aliasrc" ] && source "$ZDOTDIR/aliasrc"

# Plugins
source $ZDOTDIR/plugins/zsh-z/zsh-z.plugin.zsh 2>/dev/null
# Load zsh-syntax-highlighting; should be last.
# source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null


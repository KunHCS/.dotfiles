#!/bin/bash

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zle_highlight=('paste:none')

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

# Syntax Highlighting Options
# typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[globbing]='none'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#585858,underline"
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# fzf https://github.com/junegunn/fzf#key-bindings-for-command-line
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh 
# ALT-c displays directory tree
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
# Autosuggestion Options
bindkey '^ ' autosuggest-accept

# Load aliases and shortcuts if existent.
[ -f "$ZDOTDIR/aliasrc" ] && source "$ZDOTDIR/aliasrc"

# Basic auto/tab complete:
fpath=("$ZDOTDIR/completion" $fpath)
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit && compinit
_comp_options+=(globdots) # Include hidden files.

source $ZDOTDIR/plugin_manager 
# Plugins
add_plugin 'romkatv/powerlevel10k'
add_plugin 'Aloxaf/fzf-tab'
add_plugin 'agkozak/zsh-z'
add_plugin 'zsh-users/zsh-autosuggestions'
add_plugin 'zdharma-continuum/fast-syntax-highlighting'

# source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh
# source $ZDOTDIR/plugins/zsh-z/zsh-z.plugin.zsh
# source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# try https://github.com/zdharma-continuum/fast-syntax-highlighting
# Load zsh-syntax-highlighting; should be last.
# source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch
unsetopt autocd beep
bindkey -e

zstyle ':completion:*' menu select :compinstall filename '/home/jake/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -hoX --color=auto --group-directories-first'
alias la='ls -hoa --color=auto --group-directories-first'
alias c='clear'
alias ..='cd ..'
alias unmount='umount'

# Use vim
export VISUAL='vim'
export EDITOR='vim'
export TERM='xterm-256color'

prompt walters

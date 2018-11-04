#clear
#cat /etc/issue

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' menu select :compinstall filename '/home/jake/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l --color=auto --group-directories-first'
alias la='ls -la --color=auto --group-directories-first'
alias c='clear'
alias unmount='umount'
alias russian_kid='DISPLAY= vlc --quiet --vout caca "https://youtu.be/3eRBFkxgG7g"'

# Monitor commands
alias mainon='xrandr --output LVDS-1 --auto && secondoff'
alias mainoff='xrandr --output LVDS-1 --off && secondon'
alias secondon='xrandr --output HDMI-2 --auto && mainoff'
alias secondoff='xrandr --output HDMI-2 --off && mainon'

# SSH
alias attu='ssh jsippy@attu.cs.washington.edu'
alias attu1='ssh jsippy@attu1.cs.washington.edu'
alias attu2='ssh jsippy@attu2.cs.washington.edu'
alias attu3='ssh jsippy@attu3.cs.washington.edu'
alias attu4='ssh jsippy@attu4.cs.washington.edu'
alias mount_attu='sshfs jsippy@attu.cs.washington.edu:/homes/iws/jsippy/ /home/jake/attu'
alias unmount_attu='sudo umount -l /home/jake/attu'

# Use vim
export VISUAL='vim'
export EDITOR='vim'
export TERM='xterm-256color'
export PATH="$PATH:/home/jake/.anaconda2/bin"

# Regular term shit
# export LS_COLORS='ex-32'

prompt walters

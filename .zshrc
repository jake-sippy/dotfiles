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
alias attu5='ssh jsippy@attu5.cs.washington.edu'
alias attu6='ssh jsippy@attu6.cs.washington.edu'
alias attu7='ssh jsippy@attu7.cs.washington.edu'
alias clam='ssh jsippy@clam.cs.washington.edu'
alias aziak='ssh jsippy@aziak.cs.washington.edu'
alias mingus='ssh jsippy@mingus.cs.washington.edu'
alias thelonious='ssh jsippy@thelonious.cs.washington.edu'
alias coltrane='ssh jsippy@coltrane.cs.washington.edu'
alias mount_attu='sshfs jsippy@attu.cs.washington.edu:/homes/iws/jsippy/ /home/jake/attu'
alias unmount_attu='sudo umount -l /home/jake/attu'

# Use vim
export VISUAL='vim'
export EDITOR='vim'
export TERM='xterm-256color'

# conda
export PATH="$PATH:/home/jake/.anaconda2/bin"

# Regular term shit
# export LS_COLORS='ex-32'

prompt walters

# stop ctrl s
stty -ixon

# dont ask if i want to delete
setopt rm_star_silent

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jsippy/.anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jsippy/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jsippy/.anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jsippy/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


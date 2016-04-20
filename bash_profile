# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Colors in shell
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# Git status in prompt
source ~/.git-prompt.sh
PS1='\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W$(__git_ps1 " (%s)")\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]'

# Completion for docker
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# MacPorts Installer addition on 2016-04-10_at_22:43:56: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Show numeric rights in ls
function rights() {
    ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) \
        *2^(8-i));if(k)printf("%0o ",k);print}'
}

# Docker functions
function ds()
{
    docker-machine start default
}

function dr()
{
    docker-machine restart default
}

function docker-env() 
{
    eval $(docker-machine env)
}

function docker-cleanup {
  EXITED=$(docker ps -q -f status=exited)
    DANGLING=$(docker images -q -f "dangling=true")

    if [ "$1" == "--dry-run" ]; then
        echo "==> Would stop containers:"
        echo $EXITED
        echo "==> And images:"
        echo $DANGLING
    else
        if [ -n "$EXITED" ]; then
            docker rm $EXITED
        else
            echo "No containers to remove."
        fi
        if [ -n "$DANGLING" ]; then
            docker rmi $DANGLING
        else
            echo "No images to remove."
        fi
    fi
}

function weather() { 
    finger $1@graph.no  
}

# nmap some stff
function nmapsso {
   sudo nmap -sS -O "$1"
}

function nmapsv {
    sudo nmap -sV "$1"
}

# dumb aliases
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'" 
alias copypath='pwd|pbcopy'
alias l='ls'
alias ldirs='ls -d */'
alias la='ls -Sla'
alias vi='vim'
alias v='vim'
alias ll='ls -l'
alias gerp='grep'
alias gg='grep -inr --color'
alias skim="(head -5; tail -5) <"
alias files="cut -d: -f1 | uniq"
alias topstill='top -l 1 > /tmp/topout.txt; cd /tmp; v topout.txt'
alias sbp='source ~/.bash_profile'

# Notes
# $ caffeinate -s scp bigfile me:myserver/bigfile
# $ caffeinate -u -t 3600 // sleep 1 hr
# lsof // show ports. lsof - i | grep LISTEN
# open // open location in finder or start ap
# opendiff file1 file
# pgrep Safari // get processid by name
# pkill -lvl Safari //kill by pid
# sysctl (sys info, man it)
# scutil // set computer shizl like --set HostName "name"
# systemsetup
# textutil // convert stuff : $ textutil -convert html MyWordFile -output /tmp/webfile.html
# pbcopy pbpaste
# mdfind //spotlight for cli; mdfind -onlyin ~/dir something
# screencapture
# say // lol, store with -o filename ; file with -f filename
# launchd // man it
# cal // man it
# finger goes@graph.no
# finger o:montreal@graph.no
# file -I filename // encoding / type mime 
# security find-generic-password -ga "ROUTERNAME SSID" | grep "password:"
# host // man it

#!/bin/sh

# ALIAS
# Simon Hugh Moore
#
# Defines all my shell aliases to use.

# shortcuts 
alias sudo='sudo '
alias se='sudoedit'
alias path='echo $PATH'
alias c='clear'
alias p='sudo pacman'
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xq="xbps-query"
alias mux='tmuxinator'
alias clip='xclip -selection clipboard'
alias paste='xclip -o'
alias mail='neomutt'

# ls
alias ls='ls --color=auto --group-directories-first'
alias l='ls'
alias l.='ls -d .*'
alias l,='ls -A'
# ls only directories
alias ld='ls -d */'
alias ld.='ls -d .*/'
alias ld,='ls -d */ .*/'
# ls in list format
alias ll='ls -lh'
alias ll.='ll -d .*'
alias ll,='ll -A'
# ls directories in list format
alias lld='ll -d */'
alias lld.='ll -d .*/'
alias lld,='ll -d */ .*/'

# cd
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias cddev="cd $DEV"
alias cddl="cd $DOWNLOADS"
alias cddoc="cd $DOCUMENTS"
alias cdpic="cd $PICTURES"
alias cdvid="cd $VIDEOS"
alias cddot="cd $DOTFILES"
alias cdbin="cd $LOCALBIN"
alias cdconf="cd $CONFIG"
alias cdb="cd $LBIN"
alias cdsc="cd $SCRIPTS"
alias cdpdfs="cd $PDFS"
alias cdwh="cd $WH"
alias cdbd="cd $BUILDS"
alias fcd=". fcd"
b(){ cd "$(bk -L | fzf)"; }

# mkdir
alias mkdir='mkdir -pv'     # Add parent dir on demand

# grep
alias grep='grep --color=auto'
alias g='grep -i'
alias gv='grep -iv'
alias gc='grep'
alias gcv='grep -v'

# diff
alias diff='diff --color=auto'

# vim
alias vi='vim'
alias v='vim'
alias vg='gvim'

# git
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gch='git checkout'
alias gp='git push'
alias gl='git pull'
alias gf='git fetch'
alias gm='git merge'
alias gd='git diff'

# find
alias find='fd'

# stardict
alias def='sdcv --color'
alias defen='def -u "dictd_www.dict.ogrep_gcide"'
alias defel='def -u "dictd_www.dict.ogrep_elements"'
alias defcomp='def -u "Free On-Line Dictionary of Computing"'
alias defde='def -u "German - English" -u "English - German"'

# media
alias vid='mpv'
alias img='sxiv -a'
alias ytdl='youtube-dl'

# buku
alias bu='buku --suggest'

# wallpaper
alias randwall='feh --bg-fill --randomize ~/Pictures/*/*-ls-* &'

# system info
alias free='free -hlt'
alias free1000='free -hlt --si' # display using power of 1000 instead 1024
alias ps='ps auxf'
alias ps?='ps auxf | grep -v grep | grep -i -e "PID %CPU %MEM" -e' 
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# networking
alias ipinfo='curl ifconfig.me/all && echo ""'
alias myip='curl ifconfig.me/ip; echo'

# transmission
alias tm='transmission-remote'
alias tma='tm -er -a'


# misc
alias hist?='history | g'
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""
alias s="du -sh ./* | sort -h"
alias sd="du -sh ./*/ | sort -h"
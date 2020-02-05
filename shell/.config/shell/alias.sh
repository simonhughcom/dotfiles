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
alias bt='bluetoothctl'

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


# grep
alias grep='rg --color=auto'

# diff
alias diff='diff --color=auto'

# vim
alias vi='vim'
alias v='vim'
alias vg='gvim'

# git
alias g='git'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gch='git checkout'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --graph --abbrev-commit --pretty=oneline --decorate'
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
alias psq='ps auxf | grep -v grep | grep -i -e "PID %CPU %MEM" -e' 
alias tree2="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# networking
alias ipinfo='curl ifconfig.me/all && echo ""'
alias myip='curl ifconfig.me/ip; echo'
alias ipt='sudo iptables'
alias ip6t='sudo ip6tables'
alias iptl='sudo iptables -nvL | less'
alias ip6tl='sudo ip6tables -nvL | less'

# transmission
alias tms='transmission-daemon'
alias tm='transmission-remote'
alias tma='tm -er -a'
alias tmd='tm -l | grep -v Stopped'
# Borrowed from:
# https://github.com/gotbletu/shownotes/blob/master/transmission-cli.txt
# made some changes and added new functions.
tm-daemon() { transmission-daemon ;}
tm-quit() { killall transmission-daemon ;}
tm-altspeedenable() { transmission-remote --alt-speed ;}	# limit bandwidth
tm-altspeeddisable() {	transmission-remote --no-alt-speed ;}	# dont limit bandwidth
tm-add() { transmission-remote --add "$1" ;}
tm-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
tm-stop() { transmission-remote -t"$1" --stop ;}		# <id> or all
tm-start() { transmission-remote -t"$1" --start ;}		# <id> or all
tm-purge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tm-remove() { transmission-remote -t"$1" --remove ;}		# leaves data alone
tm-info() { transmission-remote -t"$1" --info ;}
tm-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}

# misc
alias hist='history | g'
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""
alias du='du -d1 -h'  # max depth and human readable.
alias dus='du | sort -h'  # sort by filesize.
alias dud='\du -sh -c ./*/ | sort -h' # Only directories and sort.
alias bc='bc -q -l' # don't show msg, use math lib.
alias df='df -hT --total' # human readable, print filetype and total.
alias ln='ln -iv' # asks to override file and verbose.
alias mkdir='mkdir -pv'     # Add parent dir on demand
alias qcp='qcp -f do'   # Destination column only.
alias qmv='qmv -f do'   # Destination column only.

# functions

# Color for manpages
man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;31m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[01;44;33m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[01;32m' \
  man "$@"
}

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Activate vi mode
set -o vi

# PS1 Prompt
PS1_HOST="\[\e[33m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]>\[\e[36m\]\w\[\e[m\]\\$ "

PS1_NO_HOST="\[\e[33m\]\u\[\e[m\]>\[\e[36m\]\w\[\e[m\]\\$ "

PS1_CURRENT_DIR="\[\e[33m\]\u\[\e[m\]>\[\e[36m\]\W\[\e[m\]\\$ "

export PS1=$PS1_CURRENT_DIR

##---ALIASES---##
alias sbash='source ~/.bashrc'  # reload .bashrc
alias spbash='source ~/.profile'

# shortcuts 
alias sudo='sudo '
alias path='echo $PATH'
alias c='clear'
alias p='pacman'
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
alias cdsc="cd $SCRIPTS"
alias cdpdfs="cd $PDFS"
alias cdwh="cd $WH"
b(){ cd "$(bk -L | fzf)"; }

# mkdir
alias mkdir='mkdir -pv'     # Add parent dir on demand

# grep
alias grep='rg --color=auto'
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
alias gch='git checkout'
alias ga='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'

# stardict
alias def='sdcv --color'
alias defen='def -u "dictd_www.dict.org_gcide"'
alias defel='def -u "dictd_www.dict.org_elements"'
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
alias ps?='ps auxf | grep -v rg | grep -i -e "PID %CPU %MEM" -e' 
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
alias weather="curl wttr.in"
alias s="du -sh ./* | sort -h"
alias sd="du -sh ./*/ | sort -h"

## Functions ##
# make a directory and cd into it
mcd() { mkdir "$1"; cd "$1";} 
# make a backup of a file ending in .bak
bak() { cp "$1"{,.bak};}
# check md5 of file
md5check() {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    md5sum $1 | g $i
}
sha1check() { 
    [ "$2" ] && local i=$2 || local i=$(cat -)
    sha1sum $1 | g $i
}
sha256check() {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    sha256sum $1 | g $i
}
extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
        *.gz)        gunzip $1      ;; 
        *.tar)       tar xf $1      ;; 
        *.tbz2)      tar xjf $1     ;; 
        *.tgz)       tar xzf $1     ;; 
        *.zip)       unzip $1       ;; 
        *.Z)         uncompress $1  ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file" 
     fi 
}

# Get one column of output
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

function escape {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    a=$(echo "$i" | sed -e 's/\([[\/.*]\|\]\)/\\&/g')
    echo "$a"
}

function sedeasy {
  sed -i "s/$(echo $1 | sed -e 's/\([[\/.*]\|\]\)/\\&/g')/$(echo $2 | sed -e 's/[\/&]/\\&/g')/g" $3
}

# Insert to beginning of file
function beg {
    [ "$2" ] && local i=$2 || local i=$(cat -)
    echo "$i"
    awk '{print "cool" $0}' $1
}

# FZF
# fd - cd to selected directory
fda() {
  local dir
  dir=$(find ${1:-.} -path '\/*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
fd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}
# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
# fhe - repeat history edit
writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

fhe() {
    ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | tr '\n' ' ' | sed -re 's/^\s*[0-9]+\s*//;s/[[:blank:]]*$//' | xsel
}
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#PyEnv
export PATH="/home/simon/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

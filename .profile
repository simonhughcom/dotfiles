##---PATHS---##
export HOME="/home/simon"
export SCRIPTS="$HOME/.scripts"
export DMENU="$SCRIPTS/dmenu"
export LOG="$HOME/.log"
export DIV="$HOME/.div"
export CONFIG="$HOME/.config"
export LOCALBIN="$HOME/.bin"
export DOTFILES="$HOME/.dotfiles"
export DOWNLOADS="$HOME/Downloads"
export DOCUMENTS="$HOME/Documents"
export PICTURES="$HOME/Pictures"
export DEV="$HOME/dev"

export PATH="$PATH:$SCRIPTS:$DMENU"
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export LANG="en_GB.UTF-8"
export TERM=rxvt-unicode-256color
export STARDICT_DATA_DIR="$HOME/.dic"
export XDG_CONFIG_HOME="$HOME/.config"
export LIBVA_DRIVER_NAME="radeonsi"
export WINEARCH="win64"
export WINEPREFIX="/home/simon/.steam/steam/steamapps/compatdata/377160/pfx"
export LIBVA_DRIVER_NAME="radeonsi"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

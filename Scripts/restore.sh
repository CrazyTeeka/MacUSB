#!/bin/zsh

if [ -t 1 ]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

SOURCE="/Volumes/USB/Mac"

echo "${tty_blue}==>${tty_bold} Restoring Applications...${tty_reset}"
rsync -a $SOURCE/${(C)USER}/Applications/*               /Applications/

echo "${tty_blue}==>${tty_bold} Restoring Application Support...${tty_reset}"
rsync -a $SOURCE/${(C)USER}/Library/Application\ Support $HOME/Library/

echo "${tty_blue}==>${tty_bold} Restoring Preferences...${tty_reset}"
rsync -a $SOURCE/${(C)USER}/Library/Preferences          $HOME/Library/

echo "${tty_blue}==>${tty_bold} Restoring Documents...${tty_reset}"
rsync -a $SOURCE/${(C)USER}/Home/Documents               $HOME/

echo "${tty_blue}==>${tty_bold} Restoring Downloads...${tty_reset}"
rsync -a $SOURCE/${(C)USER}/Home/Downloads               $HOME/

echo "${tty_blue}==>${tty_bold} Restoring Movies...${tty_reset}"
rsync -a $SOURCE/${(C)USER}/Home/Movies                  $HOME/

echo "${tty_blue}==>${tty_bold} Restoring Music...${tty_reset}"
rsync -a $SOURCE/${(C)USER}/Home/Music                   $HOME/

echo "${tty_blue}==>${tty_bold} Restoring Pictures...${tty_reset}"
rsync -a $SOURCE/${(C)USER}/Home/Pictures                $HOME/

echo "${tty_blue}==>${tty_bold} Done${tty_reset}"

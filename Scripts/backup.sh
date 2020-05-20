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

TARGET="/Volumes/USB/Mac"

mkdir -p $TARGET/${(C)USER}/Applications
mkdir -p $TARGET/${(C)USER}/Library
mkdir -p $TARGET/${(C)USER}/Home

echo "${tty_blue}==>${tty_bold} Copying Applications...${tty_reset}"
rsync -a /Applications/*                    $TARGET/${(C)USER}/Applications/

echo "${tty_blue}==>${tty_bold} Copying Application Support...${tty_reset}"
rsync -a $HOME/Library/Application\ Support $TARGET/${(C)USER}/Library/

echo "${tty_blue}==>${tty_bold} Copying Preferences...${tty_reset}"
rsync -a $HOME/Library/Preferences          $TARGET/${(C)USER}/Library/

echo "${tty_blue}==>${tty_bold} Copying Documents...${tty_reset}"
rsync -a $HOME/Documents                    $TARGET/${(C)USER}/Home/

echo "${tty_blue}==>${tty_bold} Copying Downloads...${tty_reset}"
rsync -a $HOME/Downloads                    $TARGET/${(C)USER}/Home/

echo "${tty_blue}==>${tty_bold} Copying Movies...${tty_reset}"
rsync -a $HOME/Movies                       $TARGET/${(C)USER}/Home/

echo "${tty_blue}==>${tty_bold} Copying Music...${tty_reset}"
rsync -a $HOME/Music                        $TARGET/${(C)USER}/Home/

echo "${tty_blue}==>${tty_bold} Copying Pictures...${tty_reset}"
rsync -a $HOME/Pictures                     $TARGET/${(C)USER}/Home/

rm -rf $TARGET/${(C)USER}/Applications/Safari.app
rm -rf $TARGET/${(C)USER}/Applications/Utilities

echo "${tty_blue}==>${tty_bold} Done${tty_reset}"

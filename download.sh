#!/bin/bash

TARGET="$HOME/MacOS"

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

if [ -z "$1" ]; then
  echo "${tty_bold}Usage:${tty_blue} download.sh${tty_bold} <${tty_blue}version${tty_bold}>${tty_reset}"
  exit 0
fi

if   [ "$1" = "10.14.6" ]; then URL="http://swcdn.apple.com/content/downloads/17/32/061-26589-A_8GJTCGY9PC/25fhcu905eta7wau7aoafu8rvdm7k1j4el"
elif [ "$1" = "10.15.5" ]; then URL="http://swcdn.apple.com/content/downloads/59/18/001-15219-A_EE9FN7UHJA/efuz3h0zlmx4qlinf4bxlguigo9jvhcr55"
else exit 0
fi

echo "${tty_blue}==>${tty_bold} Preparing...${tty_reset}"
mkdir -p  $TARGET/$1
rm    -rf $TARGET/$1/*

echo "${tty_blue}==>${tty_bold} Downloading AppleDiagnostics.dmg...${tty_reset}"
wget -q -P $TARGET/$1/ $URL/AppleDiagnostics.dmg

echo "${tty_blue}==>${tty_bold} Downloading AppleDiagnostics.chunklist...${tty_reset}"
wget -q -P $TARGET/$1/ $URL/AppleDiagnostics.chunklist

echo "${tty_blue}==>${tty_bold} Downloading BaseSystem.dmg...${tty_reset}"
wget -q -P $TARGET/$1/ $URL/BaseSystem.dmg

echo "${tty_blue}==>${tty_bold} Downloading BaseSystem.chunklist...${tty_reset}"
wget -q -P $TARGET/$1/ $URL/BaseSystem.chunklist

echo "${tty_blue}==>${tty_bold} Downloading InstallInfo.plist...${tty_reset}"
wget -q -P $TARGET/$1/ $URL/InstallInfo.plist

echo "${tty_blue}==>${tty_bold} Downloading InstallESD.dmg...${tty_reset}"
wget -q -O $TARGET/$1/InstallESD.dmg $URL/InstallESDDmg.pkg

echo "${tty_blue}==>${tty_bold} Fixing InstallInfo.plist...${tty_reset}"
sed -i '30,33 d'                                                  $TARGET/$1/InstallInfo.plist
sed -i 's/InstallESDDmg.pkg/InstallESD.dmg/g'                     $TARGET/$1/InstallInfo.plist
sed -i 's/com.apple.pkg.InstallESDDmg/com.apple.dmg.InstallESD/g' $TARGET/$1/InstallInfo.plist

echo "${tty_blue}==>${tty_bold} Done${tty_reset}"

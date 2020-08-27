#!/bin/bash

TARGET="$HOME/MacOS"

if [ -z "$1" ]; then
  echo "Usage: download.sh <version>"
  exit 0
fi

if   [ "$1" = "10.14.6" ]; then URL="http://swcdn.apple.com/content/downloads/17/32/061-26589-A_8GJTCGY9PC/25fhcu905eta7wau7aoafu8rvdm7k1j4el"
elif [ "$1" = "10.15.6" ]; then URL="http://swcdn.apple.com/content/downloads/10/06/001-36801-A_9MBEQ97Z9M/672a1q4u8978ize3s15ygivp2dqwmk10qb"
else exit 0
fi

mkdir -p "$TARGET/$1"

wget -q -P "$TARGET/$1/" "$URL/AppleDiagnostics.dmg"
wget -q -P "$TARGET/$1/" "$URL/AppleDiagnostics.chunklist"
wget -q -P "$TARGET/$1/" "$URL/BaseSystem.dmg"
wget -q -P "$TARGET/$1/" "$URL/BaseSystem.chunklist"
wget -q -P "$TARGET/$1/" "$URL/InstallInfo.plist"
wget -q -O "$TARGET/$1/InstallESD.dmg" "$URL/InstallESDDmg.pkg"

sed -i '30,33 d'                                                  "$TARGET/$1/InstallInfo.plist"
sed -i 's/InstallESDDmg.pkg/InstallESD.dmg/g'                     "$TARGET/$1/InstallInfo.plist"
sed -i 's/com.apple.pkg.InstallESDDmg/com.apple.dmg.InstallESD/g' "$TARGET/$1/InstallInfo.plist"

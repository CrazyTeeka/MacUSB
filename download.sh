#!/bin/bash

TARGET="$HOME/MacOS"

if [ -z "$1" ]; then
  echo "Usage: download.sh <version>"
  exit 0
fi

if [ "$1" = "10.15.7" ]; then URL="http://swcdn.apple.com/content/downloads/26/37/001-68446/r1dbqtmf3mtpikjnd04cq31p4jk91dceh8"
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

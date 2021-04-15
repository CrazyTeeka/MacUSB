#!/bin/bash

TARGET="$HOME/MacOS"

if [ -z "$1" ]; then
  echo "sh download.sh Catalina"
  echo "sh download.sh Mojave"
  echo "sh download.sh HighSierra"
  exit 0
fi

if [ "$1" = "Catalina" ]; then URL="http://swcdn.apple.com/content/downloads/26/37/001-68446/r1dbqtmf3mtpikjnd04cq31p4jk91dceh8"
elif [ "$1" = "Mojave" ]; then URL="http://swcdn.apple.com/content/downloads/17/32/061-26589-A_8GJTCGY9PC/25fhcu905eta7wau7aoafu8rvdm7k1j4el"
elif [ "$1" = "HighSierra" ]; then URL="http://swcdn.apple.com/content/downloads/06/50/041-91758-A_M8T44LH2AW/b5r4og05fhbgatve4agwy4kgkzv07mdid9"
else exit 0
fi

mkdir -p $TARGET/$1
rm -rf $TARGET/$1/*

wget -q -P $TARGET/$1/ $URL/AppleDiagnostics.dmg
wget -q -P $TARGET/$1/ $URL/AppleDiagnostics.chunklist
wget -q -P $TARGET/$1/ $URL/BaseSystem.dmg
wget -q -P $TARGET/$1/ $URL/BaseSystem.chunklist
wget -q -P $TARGET/$1/ $URL/InstallInfo.plist
wget -q -O $TARGET/$1/ $URL/InstallESDDmg.pkg

mv InstallESDDmg.pkg InstallESD.dmg

sed -i '30,33d' $TARGET/$1/InstallInfo.plist
sed -i 's/InstallESDDmg.pkg/InstallESD.dmg/g' $TARGET/$1/InstallInfo.plist
sed -i 's/com.apple.pkg.InstallESDDmg/com.apple.dmg.InstallESD/g' $TARGET/$1/InstallInfo.plist

#!/bin/bash

if [ -z "$1" ]; then
   echo "Usage: download.sh <version>"
   exit 0
fi

if   [ "$1" = "10.13.6" ]; then URL="http://swcdn.apple.com/content/downloads/06/50/041-91758-A_M8T44LH2AW/b5r4og05fhbgatve4agwy4kgkzv07mdid9"
elif [ "$1" = "10.14.6" ]; then URL="http://swcdn.apple.com/content/downloads/17/32/061-26589-A_8GJTCGY9PC/25fhcu905eta7wau7aoafu8rvdm7k1j4el"
elif [ "$1" = "10.15.4" ]; then URL="http://swcdn.apple.com/content/downloads/37/41/001-04366/a6boefh8b6bee4k2x6v5lwyfjr7od2ica3"
else exit 0
fi

echo "Preparing..."
mkdir -p ~/MacOS/$1 && rm -rf ~/MacOS/$1/*

echo "Downloading AppleDiagnostics.dmg..."
wget -O ~/MacOS/$1/AppleDiagnostics.dmg       $URL/AppleDiagnostics.dmg

echo "Downloading AppleDiagnostics.chunklist..."
wget -O ~/MacOS/$1/AppleDiagnostics.chunklist $URL/AppleDiagnostics.chunklist

echo "Downloading BaseSystem.dmg..."
wget -O ~/MacOS/$1/BaseSystem.dmg             $URL/BaseSystem.dmg

echo "Downloading BaseSystem.chunklist..."
wget -O ~/MacOS/$1/BaseSystem.chunklist       $URL/BaseSystem.chunklist

echo "Downloading InstallInfo.plist..."
wget -O ~/MacOS/$1/InstallInfo.plist          $URL/InstallInfo.plist

echo "Downloading InstallESD.dmg..."
wget -O ~/MacOS/$1/InstallESD.dmg             $URL/InstallESDDmg.pkg

echo "Fixing InstallInfo.plist..."
sed -i '30,33 d'                                                  ~/MacOS/$1/InstallInfo.plist
sed -i 's/InstallESDDmg.pkg/InstallESD.dmg/g'                     ~/MacOS/$1/InstallInfo.plist
sed -i 's/com.apple.pkg.InstallESDDmg/com.apple.dmg.InstallESD/g' ~/MacOS/$1/InstallInfo.plist

echo "Done"

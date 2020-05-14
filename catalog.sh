#!/bin/bash

C1="https://swscan.apple.com/content/catalogs/others/"
C2="index-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog.gz"

if [ -z "$1" ]; then
   echo "Usage: catalog.sh <version>"
   exit 0
fi

mkdir -p ~/MacOS/Catalog
cd       ~/MacOS/Catalog

echo "Downloading Catalog..."
wget -q -O catalog.gz $C1$C2
zgrep "InstallInfo.plist" catalog.gz > file.txt
sed 's/[[:space:]]//g'
sed 's/<string>//g'
sed 's/<\/string>//g'

echo "Downloading Versions..."
touch InstallInfo.plist
wget -q -i catalog.txt

echo "Processing..."
for i in 1 2 3 4 5 6 7 8 9; do cat InstallInfo.plist.$i | grep -m 1 "10." | sed 's/[[:space:]]//g' | sed 's/<string>//g' | sed 's/<\/string>//g' >> version.txt; done
n=1; while read -r catalog; do catalog_array[n]=$catalog; ((n++)); done < catalog.txt
n=1; while read -r version; do version_array[n]=$version; ((n++)); done < version.txt
for i in 1 2 3 4 5 6 7 8 9; do echo ${version_array[i]} 'URL="'${catalog_array[i]} | sed 's/\/InstallInfo.plist/"/g' >> urls.txt; done

echo "Searching..."
cat urls.txt | grep $1

echo "Cleaning Up..."
cd     ~/MacUSB
rm -rf ~/MacOS/Catalog

echo "Done"

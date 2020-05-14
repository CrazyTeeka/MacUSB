#!/bin/bash

if [ -z "$1" ]; then
   echo "Usage: catalog.sh <version>"
   exit 0
fi

mkdir -p ~/MacOS/Catalog
cd       ~/MacOS/Catalog

wget -q -O catalog.gz https://swscan.apple.com/content/catalogs/others/index-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog.gz
zgrep "InstallInfo.plist" catalog.gz | sed 's/[[:blank:]]//g' | sed 's/<string>//g' | sed 's/<\/string>//g' > catalog.txt

touch InstallInfo.plist
wget -q -i catalog.txt

for i in 1 2 3 4 5 6 7 8 9; do cat InstallInfo.plist.$i | grep -m 1 "10." | sed 's/[[:blank:]]//g' | sed 's/<string>//g' | sed 's/<\/string>//g' >> version.txt
done

n=0; while read -r catalog; do catalog_array[n]=$catalog; ((n++)); done < catalog.txt
n=0; while read -r version; do version_array[n]=$version; ((n++)); done < version.txt

for i in 0 1 2 3 4 5 6 7 8; do echo ${version_array[i]} 'URL="'${catalog_array[i]} | sed 's/\/InstallInfo.plist/"/g' >> urls.txt
done

cat urls.txt | grep $1

cd     ../../MacUSB
rm -rf ../MacOS/Catalog

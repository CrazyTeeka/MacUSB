#!/bin/bash

C1="https://swscan.apple.com/content/catalogs/others/"
C2="index-10.13-10.12-10.11-10.10-10.9-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog.gz"

if [ -z "$1" ]; then
   echo "Usage: catalog.sh <version>"
   exit 0
fi

mkdir Temp

echo "Downloading Catalog..."
wget -q -O Temp/catalog.gz $C1$C2

echo "Processing Catalog..."
zgrep "InstallInfo.plist" Temp/catalog.gz > Temp/catalog.tmp
sed -i 's/[[:space:]]//g' Temp/catalog.tmp
sed -i 's/<string>//g'    Temp/catalog.tmp
sed -i 's/<\/string>//g'  Temp/catalog.tmp

echo "Downloading Versions..."
touch Temp/InstallInfo.plist
wget -q -i Temp/catalog.tmp

echo "Processing Versions..."
for i in 1 2 3 4 5 6 7 8 9; do
   cat Temp/InstallInfo.plist.$i | grep -m 1 $1 >> Temp/version.tmp
   sed -i 's/[[:space:]]//g'                       Temp/version.tmp
   sed -i 's/<string>/URL="/g'                     Temp/version.tmp
   sed -i 's/\/InstallInfo.plist<\/string>/"/g'    Temp/version.tmp
done

n=1; while read -r catalog; do catalog_array[n]=$catalog; ((n++)); done < Temp/catalog.tmp
n=1; while read -r version; do version_array[n]=$version; ((n++)); done < Temp/version.tmp

for i in 1 2 3 4 5 6 7 8 9; do
   echo ${version_array[i]} ${catalog_array[i]} >> Temp/search.tmp
done

echo "Searching..."
cat Temp/search.tmp | grep $1

echo "Cleaning Up..."
rm -rf Temp

echo "Done"

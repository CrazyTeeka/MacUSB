#!/bin/bash

E1="EFI-OpenCore-Series-9.zip"
F1="Series-9"

AppCleaner="3.5.1"

echo "Removing Folders..."
rm -rf "OpenCore"
rm -rf "Temp"
rm -rf "Tools"

echo "Creating Folders..."
mkdir -p "OpenCore/$F1"
mkdir -p "Temp/$F1"
mkdir -p "Tools"

echo "Downloading Files..."
wget -q -P "Temp/" "https://freemacsoft.net/downloads/AppCleaner_$AppCleaner.zip"
wget -q -P "Temp/" "https://github.com/CrazyTeeka/MacUSB/blob/master/OpenCore-EFI/$E1?raw=true"

echo "Unpacking Files..."
unzip -o -qq "Temp/$E1?raw=true" -d "Temp/$F1/"

echo "Copying Files..."
cp -f  "Temp/AppCleaner_$AppCleaner.zip" "Tools/AppCleaner.zip"
cp -rf "Temp/$F1/EFI"                    "OpenCore/$F1/"

echo "OpenCore Config..."
sed -i 's/<string>Full Olarila Solution<\/string>/<string>DSDT<\/string>/g' "OpenCore/$F1/EFI/OC/config.plist"
sed -i 's/<string>RTC _STA<\/string>/<string>RTC<\/string>/g'               "OpenCore/$F1/EFI/OC/config.plist"

echo "Cleaning Up..."
rm -rf "Temp"

echo "Done"

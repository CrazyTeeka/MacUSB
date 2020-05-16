#!/bin/bash

CLOVER="5117"

USER1="CLOVER.SERIES.CHIPSET"
USER2="CLOVER.SERIES.100.200.300"
USER3="CLOVER.NOTEBOOKS.SERIES.CHIPSET"
USER4="CLOVER.NOTEBOOKS.100.200.300"

echo "Self Updating..."
rm -rf README.*   && wget -q https://github.com/CrazyTeeka/MacUSB/raw/master/README.md
rm -rf download.* && wget -q https://github.com/CrazyTeeka/MacUSB/raw/master/download.sh
rm -rf macOS.*    && wget -q https://github.com/CrazyTeeka/MacUSB/raw/master/macOS.gdisk
rm -rf make.*     && wget -q https://github.com/CrazyTeeka/MacUSB/raw/master/make.sh
rm -rf setup.*    && wget -q https://github.com/CrazyTeeka/MacUSB/raw/master/setup.sh
rm -rf update.*   && wget -q https://github.com/CrazyTeeka/MacUSB/raw/master/update.sh

echo "Removing Folders..."
rm -rf Clover
rm -rf Clover.Config
rm -rf Clover.Folder
rm -rf Scripts
rm -rf Tools
rm -rf Temp

echo "Creating Folders..."
mkdir -p Clover/EFI/BOOT
mkdir -p Clover/EFI/CLOVER
mkdir -p Clover.Config/DSDT
mkdir -p Clover.Config/THEMES
mkdir -p Clover.Folder/$USER1
mkdir -p Clover.Folder/$USER2
mkdir -p Clover.Folder/$USER3
mkdir -p Clover.Folder/$USER4
mkdir -p Scripts
mkdir -p Tools
mkdir -p Temp/$USER1
mkdir -p Temp/$USER2
mkdir -p Temp/$USER3
mkdir -p Temp/$USER4

echo "Downloading Files..."
wget -q -P Temp/               https://github.com/CloverHackyColor/CloverBootloader/releases/download/$CLOVER/CloverV2-$CLOVER.zip
wget -q -P Temp/               https://github.com/CrazyTeeka/Clover-Themes/raw/master/Clovy.zip
wget -q -P Temp/               https://www.olarila.com/files/Clover.Folder/$USER1.zip
wget -q -P Temp/               https://www.olarila.com/files/Clover.Folder/$USER2.zip
wget -q -P Temp/               https://www.olarila.com/files/Clover.Folder/$USER3.zip
wget -q -P Temp/               https://www.olarila.com/files/Clover.Folder/$USER4.zip
wget -q -P Clover.Config/DSDT/ https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VII-HERO-ASUS-3503.aml
wget -q -P Clover.Config/DSDT/ https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VIII-GENE-ASUS.aml
wget -q -O Temp/Scripts.zip    https://github.com/CrazyTeeka/MacUSB-Scripts/archive/master.zip
wget -q -P Tools/              https://github.com/CrazyTeeka/MacUSB-Tools/raw/master/RunMe.app.zip

echo "Unpacking Files..."
unzip -o -qq Temp/CloverV2-$CLOVER.zip -d Temp/
unzip -o -qq Temp/Clovy.zip            -d Clover.Config/THEMES/
unzip -o -qq Temp/Scripts.zip          -d Temp/
unzip -o -qq Temp/$USER1.zip           -d Temp/$USER1/
unzip -o -qq Temp/$USER2.zip           -d Temp/$USER2/
unzip -o -qq Temp/$USER3.zip           -d Temp/$USER3/
unzip -o -qq Temp/$USER4.zip           -d Temp/$USER4/

echo "Copying Files..."
cp -f  Temp/CloverV2/EFI/BOOT/BOOTX64.efi                Clover/EFI/BOOT/
cp -f  Temp/CloverV2/EFI/CLOVER/CLOVERX64.efi            Clover/EFI/CLOVER/
cp -rf Temp/CloverV2/EFI/CLOVER/drivers                  Clover/EFI/CLOVER/
cp -rf Temp/CloverV2/EFI/CLOVER/tools                    Clover/EFI/CLOVER/
cp -rf Temp/$USER1/EFI                                   Clover.Folder/$USER1/
cp -rf Temp/$USER2/EFI                                   Clover.Folder/$USER2/
cp -rf Temp/$USER3/EFI                                   Clover.Folder/$USER3/
cp -rf Temp/$USER4/EFI                                   Clover.Folder/$USER4/
#cp -f  Clover.Config/DSDT/MAXIMUS-VII-HERO-ASUS-3503.aml Clover.Folder/$USER1/EFI/CLOVER/ACPI/patched/DSDT.aml
#cp -f  Clover.Config/DSDT/MAXIMUS-VIII-GENE-ASUS.aml     Clover.Folder/$USER2/EFI/CLOVER/ACPI/patched/DSDT.aml
cp -rf Clover.Config/THEMES/Clovy                        Clover.Folder/$USER1/EFI/CLOVER/themes/
cp -rf Clover.Config/THEMES/Clovy                        Clover.Folder/$USER2/EFI/CLOVER/themes/
cp -rf Clover.Config/THEMES/Clovy                        Clover.Folder/$USER3/EFI/CLOVER/themes/
cp -rf Clover.Config/THEMES/Clovy                        Clover.Folder/$USER4/EFI/CLOVER/themes/
cp -rf Temp/MacUSB-Scripts-master/*                      Scripts/

echo "Clovy Theme..."
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' Clover.Folder/$USER1/EFI/CLOVER/config.plist
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' Clover.Folder/$USER2/EFI/CLOVER/config.plist
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' Clover.Folder/$USER3/EFI/CLOVER/config.plist
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' Clover.Folder/$USER4/EFI/CLOVER/config.plist

echo "Cleaning Up..."
rm -rf Clover.Folder/$USER1/EFI/CLOVER/themes/Olarila
rm -rf Clover.Folder/$USER2/EFI/CLOVER/themes/Olarila
rm -rf Clover.Folder/$USER3/EFI/CLOVER/themes/Olarila
rm -rf Clover.Folder/$USER4/EFI/CLOVER/themes/Olarila
rm -rf Temp

echo "Done"

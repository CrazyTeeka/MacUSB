#!/bin/bash

CLOVER="5117"

USER1="CLOVER.SERIES.CHIPSET"
USER2="CLOVER.SERIES.100.200.300"

rm -rf Clover
rm -rf Clover.Config
rm -rf Clover.User
rm -rf Scripts
rm -rf Tools
rm -rf Temp

mkdir -p Clover/EFI/BOOT
mkdir -p Clover/EFI/CLOVER
mkdir -p Clover.Config/CONFIG
mkdir -p Clover.Config/DSDT
mkdir -p Clover.Config/THEMES
mkdir -p Clover.User/$USER1
mkdir -p Clover.User/$USER2
mkdir -p Scripts
mkdir -p Tools
mkdir -p Temp

wget -q -P Temp/                 https://github.com/CloverHackyColor/CloverBootloader/releases/download/$CLOVER/CloverV2-$CLOVER.zip
wget -q -P Temp/                 https://github.com/CrazyTeeka/Clover-Themes/raw/master/Clovy.zip
wget -q -P Temp/                 https://www.olarila.com/files/Clover.Folder/$USER1.zip
wget -q -P Temp/                 https://www.olarila.com/files/Clover.Folder/$USER2.zip
wget -q -P Clover.Config/Config/ https://github.com/CrazyTeeka/Clover-Config/raw/master/CLOVER.SERIES.CHIPSET.plist
wget -q -P Clover.Config/Config/ https://github.com/CrazyTeeka/Clover-Config/raw/master/CLOVER.SERIES.100.200.300.plist
wget -q -P Clover.Config/DSDT/   https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VII-HERO-ASUS-3503.aml
wget -q -P Clover.Config/DSDT/   https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VIII-GENE-ASUS.aml
wget -q -P Temp/                 https://github.com/CrazyTeeka/MacUSB-Scripts/archive/master.zip
wget -q -P Tools/                https://github.com/CrazyTeeka/MacUSB-Tools/raw/master/RunMe.app.zip

mkdir -p Temp/$USER1
mkdir -p Temp/$USER2

unzip -o -qq Temp/CloverV2-$CLOVER.zip -d Temp/
unzip -o -qq Temp/Clovy.zip            -d Clover.Config/Themes/
unzip -o -qq Temp/master.zip           -d Temp/
unzip -o -qq Temp/$USER1.zip           -d Temp/$USER1/
unzip -o -qq Temp/$USER2.zip           -d Temp/$USER2/

cp -f  Temp/CloverV2/EFI/BOOT/BOOTX64.efi                   Clover/EFI/BOOT/
cp -f  Temp/CloverV2/EFI/CLOVER/CLOVERX64.efi               Clover/EFI/CLOVER/
cp -rf Temp/CloverV2/EFI/CLOVER/drivers                     Clover/EFI/CLOVER/
cp -rf Temp/CloverV2/EFI/CLOVER/tools                       Clover/EFI/CLOVER/
cp -rf Temp/$USER1/EFI                                      Clover.User/$USER1/
cp -rf Temp/$USER2/EFI                                      Clover.User/$USER2/
cp -f  Clover.Config/Config/CLOVER.SERIES.CHIPSET.plist     Clover.User/$USER1/EFI/CLOVER/config.plist
cp -f  Clover.Config/Config/CLOVER.SERIES.100.200.300.plist Clover.User/$USER2/EFI/CLOVER/config.plist
cp -f  Clover.Config/DSDT/MAXIMUS-VII-HERO-ASUS-3503.aml    Clover.User/$USER1/EFI/CLOVER/ACPI/patched/DSDT.aml
cp -f  Clover.Config/DSDT/MAXIMUS-VIII-GENE-ASUS.aml        Clover.User/$USER2/EFI/CLOVER/ACPI/patched/DSDT.aml
cp -rf Clover.Config/Themes/Clovy                           Clover.User/$USER1/EFI/CLOVER/themes/
cp -rf Clover.Config/Themes/Clovy                           Clover.User/$USER2/EFI/CLOVER/themes/
cp -rf Temp/MacUSB-Scripts-master/*                         Scripts/

rm -rf Clover.User/$USER1/EFI/CLOVER/themes/Olarila
rm -rf Clover.User/$USER2/EFI/CLOVER/themes/Olarila

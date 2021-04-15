#!/bin/bash

Clover="5133"
OpenCore="0.6.8"

URL="https://github.com/CrazyTeeka/MacUSB/raw/master/Files"

mkdir -p Clover
mkdir -p OpenCore
mkdir -p Config
mkdir -p Drivers
mkdir -p DSDT
mkdir -p Tools
mkdir -p Temp

rm -rf Clover/*
rm -rf OpenCore/*
rm -rf Config/*
rm -rf Drivers/*
rm -rf DSDT/*
rm -rf Tools/*
rm -rf Temp/*

mkdir -p Clover/Series-9
mkdir -p Clover/Series-100
mkdir -p Clover/Series-200
mkdir -p Clover/Series-300
mkdir -p Clover/Series-400
mkdir -p Clover/Update

mkdir -p OpenCore/Series-9
mkdir -p OpenCore/Series-100
mkdir -p OpenCore/Series-200
mkdir -p OpenCore/Series-300
mkdir -p OpenCore/Series-400
mkdir -p OpenCore/Series-500
mkdir -p OpenCore/Update

wget -q -P Temp/ $URL/CloverV2-$Clover.zip
wget -q -P Temp/ $URL/Clover-Series-9.zip
wget -q -P Temp/ $URL/Clover-Series-100-200.zip
wget -q -P Temp/ $URL/Clover-Series-300-400.zip

wget -q -P Temp/ $URL/Clover-Series-9.plist
wget -q -P Temp/ $URL/Clover-Series-100-200.plist
wget -q -P Temp/ $URL/Clover-Series-300-400.plist

wget -q -P Temp/ $URL/Clover-Theme-Clovy.zip
wget -q -P Temp/ $URL/Clover-DSDT-Asus-Maximus-VII-Hero-3503.aml
wget -q -P Temp/ $URL/Clover-DSDT-Asus-Maximus-VIII-Gene-1902.aml

wget -q -P Temp/ $URL/OpenCore-$OpenCore-RELEASE.zip
wget -q -P Temp/ $URL/OpenCore-Series-9.zip
wget -q -P Temp/ $URL/OpenCore-Series-100-200.zip
wget -q -P Temp/ $URL/OpenCore-Series-300-400.zip
wget -q -P Temp/ $URL/OpenCore-Series-500.zip

wget -q -P Temp/ $URL/Clover-Configurator.zip
wget -q -P Temp/ $URL/OpenCore-Configurator.zip
wget -q -P Temp/ $URL/Drivers-HfsPlus.efi
wget -q -P Temp/ $URL/Tools-AppCleaner.zip
wget -q -P Temp/ $URL/Tools-PlistEditPro.zip
wget -q -P Temp/ $URL/Tools-RunMe.zip

unzip -o -qq Temp/CloverV2-$Clover.zip -d Clover/Update/
unzip -o -qq Temp/Clover-Series-9.zip -d Clover/Series-9/
unzip -o -qq Temp/Clover-Series-100-200.zip -d Clover/Series-100/
unzip -o -qq Temp/Clover-Series-100-200.zip -d Clover/Series-200/
unzip -o -qq Temp/Clover-Series-300-400.zip -d Clover/Series-300/
unzip -o -qq Temp/Clover-Series-300-400.zip -d Clover/Series-400/

unzip -o -qq Temp/Clover-Theme-Clovy.zip -d Clover/Series-9/EFI/CLOVER/themes/
unzip -o -qq Temp/Clover-Theme-Clovy.zip -d Clover/Series-100/EFI/CLOVER/themes/
unzip -o -qq Temp/Clover-Theme-Clovy.zip -d Clover/Series-200/EFI/CLOVER/themes/
unzip -o -qq Temp/Clover-Theme-Clovy.zip -d Clover/Series-300/EFI/CLOVER/themes/
unzip -o -qq Temp/Clover-Theme-Clovy.zip -d Clover/Series-400/EFI/CLOVER/themes/

unzip -o -qq Temp/OpenCore-$OpenCore-RELEASE.zip -d OpenCore/Update/
unzip -o -qq Temp/OpenCore-Series-9.zip -d OpenCore/Series-9/
unzip -o -qq Temp/OpenCore-Series-100-200.zip -d OpenCore/Series-100/
unzip -o -qq Temp/OpenCore-Series-100-200.zip -d OpenCore/Series-200/
unzip -o -qq Temp/OpenCore-Series-300-400.zip -d OpenCore/Series-300/
unzip -o -qq Temp/OpenCore-Series-300-400.zip -d OpenCore/Series-400/
unzip -o -qq Temp/OpenCore-Series-500.zip -d OpenCore/Series-500/

cp -rf Clover/Update/CloverV2/EFI Clover/Update/
cp -rf OpenCore/Update/X64/EFI OpenCore/Update/

rm -rf Clover/Series-9/__MACOSX
rm -rf Clover/Series-100/__MACOSX
rm -rf Clover/Series-200/__MACOSX
rm -rf Clover/Series-300/__MACOSX
rm -rf Clover/Series-400/__MACOSX
rm -rf Clover/Update/CloverV2

rm -rf OpenCore/Series-9/__MACOSX
rm -rf OpenCore/Series-100/__MACOSX
rm -rf OpenCore/Series-200/__MACOSX
rm -rf OpenCore/Series-300/__MACOSX
rm -rf OpenCore/Series-400/__MACOSX
rm -rf OpenCore/Series-500/__MACOSX
rm -rf OpenCore/Update/Docs
rm -rf OpenCore/Update/IA32
rm -rf OpenCore/Update/Utilities
rm -rf OpenCore/Update/X64

cp -f Temp/Clover-Series-9.plist Config/
cp -f Temp/Clover-Series-100-200.plist Config/
cp -f Temp/Clover-Series-300-400.plist Config/

cp -f Temp/Clover-DSDT-Asus-Maximus-VII-Hero-3503.aml DSDT/
cp -f Temp/Clover-DSDT-Asus-Maximus-VIII-Gene-1902.aml DSDT/

cp -f Temp/Clover-Configurator.zip Tools/
cp -f Temp/OpenCore-Configurator.zip Tools/

cp -f Temp/Drivers-HfsPlus.efi Drivers/HfsPlus.efi
cp -f Temp/Tools-AppCleaner.zip Tools/AppCleaner.zip
cp -f Temp/Tools-PlistEditPro.zip Tools/PlistEditPro.zip
cp -f Temp/Tools-RunMe.zip Tools/RunMe.zip

cp -f Config/Clover-Series-9.plist Clover/Series-9/EFI/CLOVER/config.plist
cp -f Config/Clover-Series-100-200.plist Clover/Series-100/EFI/CLOVER/config.plist
cp -f Config/Clover-Series-100-200.plist Clover/Series-200/EFI/CLOVER/config.plist
cp -f Config/Clover-Series-300-400.plist Clover/Series-300/EFI/CLOVER/config.plist
cp -f Config/Clover-Series-300-400.plist Clover/Series-400/EFI/CLOVER/config.plist

cp -f Drivers/HfsPlus.efi Clover/Series-9/EFI/CLOVER/drivers/UEFI/HfsPlus.efi
cp -f Drivers/HfsPlus.efi Clover/Series-100/EFI/CLOVER/drivers/UEFI/HfsPlus.efi
cp -f Drivers/HfsPlus.efi Clover/Series-200/EFI/CLOVER/drivers/UEFI/HfsPlus.efi
cp -f Drivers/HfsPlus.efi Clover/Series-300/EFI/CLOVER/drivers/UEFI/HfsPlus.efi
cp -f Drivers/HfsPlus.efi Clover/Series-400/EFI/CLOVER/drivers/UEFI/HfsPlus.efi

rm -rf Clover/Series-9/EFI/CLOVER/drivers/BIOS
rm -rf Clover/Series-100/EFI/CLOVER/drivers/BIOS
rm -rf Clover/Series-200/EFI/CLOVER/drivers/BIOS
rm -rf Clover/Series-300/EFI/CLOVER/drivers/BIOS
rm -rf Clover/Series-400/EFI/CLOVER/drivers/BIOS

rm -rf Clover/Series-9/EFI/CLOVER/misc
rm -rf Clover/Series-100/EFI/CLOVER/misc
rm -rf Clover/Series-200/EFI/CLOVER/misc
rm -rf Clover/Series-300/EFI/CLOVER/misc
rm -rf Clover/Series-400/EFI/CLOVER/misc

rm -rf Clover/Series-9/EFI/CLOVER/themes/Olarila
rm -rf Clover/Series-100/EFI/CLOVER/themes/Olarila
rm -rf Clover/Series-200/EFI/CLOVER/themes/Olarila
rm -rf Clover/Series-300/EFI/CLOVER/themes/Olarila
rm -rf Clover/Series-400/EFI/CLOVER/themes/Olarila

cp -f Drivers/HfsPlus.efi OpenCore/Series-9/EFI/OC/Drivers/HfsPlus.efi
cp -f Drivers/HfsPlus.efi OpenCore/Series-100/EFI/OC/Drivers/HfsPlus.efi
cp -f Drivers/HfsPlus.efi OpenCore/Series-200/EFI/OC/Drivers/HfsPlus.efi
cp -f Drivers/HfsPlus.efi OpenCore/Series-300/EFI/OC/Drivers/HfsPlus.efi
cp -f Drivers/HfsPlus.efi OpenCore/Series-400/EFI/OC/Drivers/HfsPlus.efi
cp -f Drivers/HfsPlus.efi OpenCore/Series-500/EFI/OC/Drivers/HfsPlus.efi

rm -f OpenCore/Series-9/EFI/OC/Drivers/OpenHfsPlus.efi
rm -f OpenCore/Series-100/EFI/OC/Drivers/OpenHfsPlus.efi
rm -f OpenCore/Series-200/EFI/OC/Drivers/OpenHfsPlus.efi
rm -f OpenCore/Series-300/EFI/OC/Drivers/OpenHfsPlus.efi
rm -f OpenCore/Series-400/EFI/OC/Drivers/OpenHfsPlus.efi
rm -f OpenCore/Series-500/EFI/OC/Drivers/OpenHfsPlus.efi

sed -i '11s/<string>Full Olarila Solution<\/string>/<string>DSDT<\/string>/g' OpenCore/Series-9/EFI/OC/config.plist
sed -i '11s/<string>Real Full Solution<\/string>/<string>DSDT<\/string>/g' OpenCore/Series-100/EFI/OC/config.plist
sed -i '11s/<string>Real Full Solution<\/string>/<string>DSDT<\/string>/g' OpenCore/Series-200/EFI/OC/config.plist
sed -i '11s/<string>Real Full Solution<\/string>/<string>DSDT<\/string>/g' OpenCore/Series-300/EFI/OC/config.plist
sed -i '11s/<string>Real Full Solution<\/string>/<string>DSDT<\/string>/g' OpenCore/Series-400/EFI/OC/config.plist
sed -i '11s/<string>Real Full Solution<\/string>/<string>DSDT<\/string>/g' OpenCore/Series-500/EFI/OC/config.plist
sed -i '19s/<string><\/string>/<string>SSDT Device EC<\/string>/g' OpenCore/Series-9/EFI/OC/config.plist

sed -i '36s/<string>RTC _STA<\/string>/<string>RTC<\/string>/g' OpenCore/Series-9/EFI/OC/config.plist
sed -i '44s/<string>Fix RTC _STA bug<\/string>/<string>RTC<\/string>/g' OpenCore/Series-100/EFI/OC/config.plist
sed -i '44s/<string>Fix RTC _STA bug<\/string>/<string>RTC<\/string>/g' OpenCore/Series-200/EFI/OC/config.plist
sed -i '44s/<string>Fix RTC _STA bug<\/string>/<string>RTC<\/string>/g' OpenCore/Series-300/EFI/OC/config.plist
sed -i '44s/<string>Fix RTC _STA bug<\/string>/<string>RTC<\/string>/g' OpenCore/Series-400/EFI/OC/config.plist
sed -i '44s/<string>Fix RTC _STA bug<\/string>/<string>RTC<\/string>/g' OpenCore/Series-500/EFI/OC/config.plist

sed -i '836s/<string>NvmExpressDxe.efi<\/string>/<string>HfsPlus.efi<\/string>/g' OpenCore/Series-100/EFI/OC/config.plist
sed -i '837s/<string>OpenCanopy.efi<\/string>/<string>NvmExpressDxe.efi<\/string>/g' OpenCore/Series-100/EFI/OC/config.plist
sed -i '838s/<string>OpenHfsPlus.efi<\/string>/<string>OpenCanopy.efi<\/string>/g' OpenCore/Series-100/EFI/OC/config.plist
sed -i '839s/<string>OpenRuntime.efi<\/string>/<string>OpenRuntime.efi<\/string>/g' OpenCore/Series-100/EFI/OC/config.plist
sed -i '836s/<string>NvmExpressDxe.efi<\/string>/<string>HfsPlus.efi<\/string>/g' OpenCore/Series-200/EFI/OC/config.plist
sed -i '837s/<string>OpenCanopy.efi<\/string>/<string>NvmExpressDxe.efi<\/string>/g' OpenCore/Series-200/EFI/OC/config.plist
sed -i '838s/<string>OpenHfsPlus.efi<\/string>/<string>OpenCanopy.efi<\/string>/g' OpenCore/Series-200/EFI/OC/config.plist
sed -i '839s/<string>OpenRuntime.efi<\/string>/<string>OpenRuntime.efi<\/string>/g' OpenCore/Series-200/EFI/OC/config.plist
sed -i '836s/<string>NvmExpressDxe.efi<\/string>/<string>HfsPlus.efi<\/string>/g' OpenCore/Series-300/EFI/OC/config.plist
sed -i '837s/<string>OpenCanopy.efi<\/string>/<string>NvmExpressDxe.efi<\/string>/g' OpenCore/Series-300/EFI/OC/config.plist
sed -i '838s/<string>OpenHfsPlus.efi<\/string>/<string>OpenCanopy.efi<\/string>/g' OpenCore/Series-300/EFI/OC/config.plist
sed -i '839s/<string>OpenRuntime.efi<\/string>/<string>OpenRuntime.efi<\/string>/g' OpenCore/Series-300/EFI/OC/config.plist
sed -i '836s/<string>NvmExpressDxe.efi<\/string>/<string>HfsPlus.efi<\/string>/g' OpenCore/Series-400/EFI/OC/config.plist
sed -i '837s/<string>OpenCanopy.efi<\/string>/<string>NvmExpressDxe.efi<\/string>/g' OpenCore/Series-400/EFI/OC/config.plist
sed -i '838s/<string>OpenHfsPlus.efi<\/string>/<string>OpenCanopy.efi<\/string>/g' OpenCore/Series-400/EFI/OC/config.plist
sed -i '839s/<string>OpenRuntime.efi<\/string>/<string>OpenRuntime.efi<\/string>/g' OpenCore/Series-400/EFI/OC/config.plist
sed -i '836s/<string>NvmExpressDxe.efi<\/string>/<string>HfsPlus.efi<\/string>/g' OpenCore/Series-500/EFI/OC/config.plist
sed -i '837s/<string>OpenCanopy.efi<\/string>/<string>NvmExpressDxe.efi<\/string>/g' OpenCore/Series-500/EFI/OC/config.plist
sed -i '838s/<string>OpenHfsPlus.efi<\/string>/<string>OpenCanopy.efi<\/string>/g' OpenCore/Series-500/EFI/OC/config.plist
sed -i '839s/<string>OpenRuntime.efi<\/string>/<string>OpenRuntime.efi<\/string>/g' OpenCore/Series-500/EFI/OC/config.plist

sed -i '27s/<string>SSDT ThundetBolt HotPlug<\/string>/<string>SSDT ThunderBolt HotPlug<\/string>/g' OpenCore/Series-100/EFI/OC/config.plist
sed -i '27s/<string>SSDT ThundetBolt HotPlug<\/string>/<string>SSDT ThunderBolt HotPlug<\/string>/g' OpenCore/Series-200/EFI/OC/config.plist
sed -i '27s/<string>SSDT ThundetBolt HotPlug<\/string>/<string>SSDT ThunderBolt HotPlug<\/string>/g' OpenCore/Series-300/EFI/OC/config.plist
sed -i '27s/<string>SSDT ThundetBolt HotPlug<\/string>/<string>SSDT ThunderBolt HotPlug<\/string>/g' OpenCore/Series-400/EFI/OC/config.plist
sed -i '27s/<string>SSDT ThundetBolt HotPlug<\/string>/<string>SSDT ThunderBolt HotPlug<\/string>/g' OpenCore/Series-500/EFI/OC/config.plist

rm -rf Temp

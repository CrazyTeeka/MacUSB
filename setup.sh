#!/bin/bash

Clover="5133"
OpenCore="0.6.9"

FILES="https://github.com/CrazyTeeka/MacUSB/raw/master/Files"
KEXTS="https://github.com/CrazyTeeka/MacUSB/raw/master/Kexts"

mkdir -p Clover
mkdir -p OpenCore
mkdir -p Config
mkdir -p Drivers
mkdir -p DSDT
mkdir -p Kexts
mkdir -p Tools
mkdir -p Temp

rm -rf Clover/*
rm -rf OpenCore/*
rm -rf Config/*
rm -rf Drivers/*
rm -rf DSDT/*
rm -rf Kexts/*
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

wget -q -P Temp/ $FILES/CloverV2-$Clover.zip
wget -q -P Temp/ $FILES/Clover-Series-9.zip
wget -q -P Temp/ $FILES/Clover-Series-100-200.zip
wget -q -P Temp/ $FILES/Clover-Series-300-400.zip

wget -q -P Temp/ $FILES/Clover-Series-9.plist
wget -q -P Temp/ $FILES/Clover-Series-100-200.plist
wget -q -P Temp/ $FILES/Clover-Series-300-400.plist

wget -q -P Temp/ $FILES/Clover-Theme-Clovy.zip
wget -q -P Temp/ $FILES/Clover-DSDT-Asus-Maximus-VII-Hero-3503.aml
wget -q -P Temp/ $FILES/Clover-DSDT-Asus-Maximus-VIII-Gene-1902.aml

wget -q -P Temp/ $FILES/OpenCore-$OpenCore-RELEASE.zip
wget -q -P Temp/ $FILES/OpenCore-Series-9.zip
wget -q -P Temp/ $FILES/OpenCore-Series-100-200.zip
wget -q -P Temp/ $FILES/OpenCore-Series-300-400.zip
wget -q -P Temp/ $FILES/OpenCore-Series-500.zip

wget -q -P Temp/ $FILES/Clover-Configurator.zip
wget -q -P Temp/ $FILES/OpenCore-Configurator.zip
wget -q -P Temp/ $FILES/Drivers-HfsPlus.efi
wget -q -P Temp/ $FILES/Tools-AppCleaner.zip
wget -q -P Temp/ $FILES/Tools-PlistEditPro.zip
wget -q -P Temp/ $FILES/Tools-RunMe.zip

wget -q -P Temp/ $KEXTS/AirportBrcmFixup-2.1.2-RELEASE.zip
wget -q -P Temp/ $KEXTS/AppleALC-1.5.9-RELEASE.zip
wget -q -P Temp/ $KEXTS/AtherosE2200Ethernet-V2.2.2.zip
wget -q -P Temp/ $KEXTS/IntelMausi-1.0.5-RELEASE.zip
wget -q -P Temp/ $KEXTS/Lilu-1.5.2-RELEASE.zip
wget -q -P Temp/ $KEXTS/RealtekRTL8111-V2.4.0.zip
wget -q -P Temp/ $KEXTS/RestrictEvents-1.0.0-RELEASE.zip
wget -q -P Temp/ $KEXTS/VirtualSMC-1.2.2-RELEASE.zip
wget -q -P Temp/ $KEXTS/WhateverGreen-1.4.9-RELEASE.zip

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

unzip -o -qq Temp/AirportBrcmFixup-2.1.2-RELEASE.zip -d Kexts/
unzip -o -qq Temp/AppleALC-1.5.9-RELEASE.zip -d Kexts/
unzip -o -qq Temp/AtherosE2200Ethernet-V2.2.2.zip -d Kexts/
unzip -o -qq Temp/IntelMausi-1.0.5-RELEASE.zip -d Kexts/
unzip -o -qq Temp/Lilu-1.5.2-RELEASE.zip -d Kexts/
unzip -o -qq Temp/RealtekRTL8111-V2.4.0.zip -d Kexts/
unzip -o -qq Temp/RestrictEvents-1.0.0-RELEASE.zip -d Kexts/
unzip -o -qq Temp/VirtualSMC-1.2.2-RELEASE.zip -d Kexts/
unzip -o -qq Temp/WhateverGreen-1.4.9-RELEASE.zip -d Kexts/

cp -rf Clover/Update/CloverV2/EFI Clover/Update/
cp -rf OpenCore/Update/X64/EFI OpenCore/Update/

cp -rf Kexts/AtherosE2200Ethernet-V2.2.2/Release/AtherosE2200Ethernet.kext Kexts/
rm -rf Kexts/AtherosE2200Ethernet-V2.2.2
cp -rf Kexts/Kexts/VirtualSMC.kext Kexts/
rm -rf Kexts/Kexts
cp -rf Kexts/RealtekRTL8111-V2.4.0/Release/RealtekRTL8111.kext Kexts/
rm -rf Kexts/RealtekRTL8111-V2.4.0
rm -rf Kexts/IntelSnowMausi.kext
rm -rf Kexts/*.dSYM
rm -rf Kexts/dSYM
rm -rf Kexts/__MACOSX
rm -rf Kexts/Tools
rm -rf Kexts/WhateverName.app
rm -f  Kexts/alc-verb

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

rm -rf Clover/Update/EFI/CLOVER/ACPI
rm -rf Clover/Update/EFI/CLOVER/doc
rm -rf Clover/Update/EFI/CLOVER/kexts
rm -rf Clover/Update/EFI/CLOVER/misc
rm -rf Clover/Update/EFI/CLOVER/OEM
rm -rf Clover/Update/EFI/CLOVER/ROM
rm -rf Clover/Update/EFI/CLOVER/themes
rm -f  Clover/Update/EFI/CLOVER/config-sample.plist

cp -f Clover/Update/EFI/CLOVER/drivers/off/UEFI/FileSystem/ApfsDriverLoader.efi Clover/Update/EFI/CLOVER/drivers/UEFI/
cp -f Clover/Update/EFI/CLOVER/drivers/off/UEFI/MemoryFix/OpenRuntime.efi Clover/Update/EFI/CLOVER/drivers/UEFI/

rm -rf Clover/Update/EFI/CLOVER/drivers/BIOS
rm -rf Clover/Update/EFI/CLOVER/drivers/off
rm -f  Clover/Update/EFI/CLOVER/drivers/UEFI/AudioDxe.efi
rm -f  Clover/Update/EFI/CLOVER/drivers/UEFI/FSInject.efi
rm -f  Clover/Update/EFI/CLOVER/drivers/UEFI/SMCHelper.efi

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

rm -rf OpenCore/Update/EFI/OC/ACPI
rm -rf OpenCore/Update/EFI/OC/Kexts
rm -rf OpenCore/Update/EFI/OC/Resources
rm -f  OpenCore/Update/EFI/OC/Drivers/AudioDxe.efi
rm -f  OpenCore/Update/EFI/OC/Drivers/HiiDatabase.efi
rm -f  OpenCore/Update/EFI/OC/Drivers/OpenHfsPlus.efi
rm -f  OpenCore/Update/EFI/OC/Drivers/OpenPartitionDxe.efi
rm -f  OpenCore/Update/EFI/OC/Drivers/OpenUsbKbDxe.efi
rm -f  OpenCore/Update/EFI/OC/Drivers/Ps2KeyboardDxe.efi
rm -f  OpenCore/Update/EFI/OC/Drivers/Ps2MouseDxe.efi
rm -f  OpenCore/Update/EFI/OC/Drivers/UsbMouseDxe.efi
rm -f  OpenCore/Update/EFI/OC/Drivers/XhciDxe.efi

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

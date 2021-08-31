#!/bin/bash

OpenCoreVersion="0.7.2"

DSDT="https://github.com/CrazyTeeka/MacUSB/raw/master/DSDT"
KEXTS="https://github.com/CrazyTeeka/MacUSB/raw/master/Kexts"
CLOVER="https://github.com/CrazyTeeka/MacUSB/raw/master/Clover"
OPENCORE="https://github.com/CrazyTeeka/MacUSB/raw/master/OpenCore"
SCRIPTS="https://github.com/CrazyTeeka/MacUSB/raw/master/Scripts"
TOOLS="https://github.com/CrazyTeeka/MacUSB/raw/master/Tools"

echo "Preparing..."

mkdir -p Clover
mkdir -p OpenCore
mkdir -p DSDT
mkdir -p Kexts
mkdir -p Scripts
mkdir -p Temp
mkdir -p Tools
mkdir -p Uploads

rm -rf Clover/*
rm -rf OpenCore/*
rm -rf DSDT/*
rm -rf Kexts/*
rm -rf Scripts/*
rm -rf Temp/*
rm -rf Tools/*
rm -rf Uploads/*

mkdir -p Clover/Series-5
mkdir -p Clover/Series-6
mkdir -p Clover/Series-7
mkdir -p Clover/Series-8
mkdir -p Clover/Series-9

mkdir -p OpenCore/Series-6
mkdir -p OpenCore/Series-7
mkdir -p OpenCore/Series-8
mkdir -p OpenCore/Series-9
mkdir -p OpenCore/Series-100
mkdir -p OpenCore/Series-200
mkdir -p OpenCore/Series-300
mkdir -p OpenCore/Series-400
mkdir -p OpenCore/Series-500
mkdir -p OpenCore/Update

mkdir -p Scripts/Linux
mkdir -p Scripts/Mac

echo "Downloading Files..."

wget -q -P Temp/ $CLOVER/Clover-Series-5.zip
wget -q -P Temp/ $CLOVER/Clover-Series-6.zip
wget -q -P Temp/ $CLOVER/Clover-Series-7.zip
wget -q -P Temp/ $CLOVER/Clover-Series-8.zip
wget -q -P Temp/ $CLOVER/Clover-Series-9.zip

wget -q -P Temp/ $OPENCORE/OpenCore-$OpenCoreVersion-RELEASE.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-6.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-7.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-8.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-9.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-100.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-200.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-300.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-400.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-500.zip

wget -q -P Tools/ $CLOVER/Clover-Configurator.zip
wget -q -P Tools/ $OPENCORE/OpenCore-Configurator.zip

#wget -q -P DSDT/ $DSDT/Asus-RoG-Maximus-VII-Hero-3503.aml
#wget -q -P DSDT/ $DSDT/Asus-RoG-Maximus-VIII-Gene-1902.aml

wget -q -P Temp/ $KEXTS/AirportBrcmFixup-2.1.3-RELEASE.zip
wget -q -P Temp/ $KEXTS/AppleALC-1.6.3-RELEASE.zip
wget -q -P Temp/ $KEXTS/AtherosE2200Ethernet-V2.2.2.zip
wget -q -P Temp/ $KEXTS/IntelMausi-1.0.7-RELEASE.zip
wget -q -P Temp/ $KEXTS/Lilu-1.5.5-RELEASE.zip
wget -q -P Temp/ $KEXTS/RealtekRTL8111-V2.4.2.zip
wget -q -P Temp/ $KEXTS/RestrictEvents-1.0.3-RELEASE.zip
wget -q -P Temp/ $KEXTS/VirtualSMC-1.2.6-RELEASE.zip
wget -q -P Temp/ $KEXTS/WhateverGreen-1.5.2-RELEASE.zip

wget -q -P Scripts/Linux/ $SCRIPTS/Linux/update
wget -q -P Scripts/Linux/ $SCRIPTS/Linux/zip

wget -q -P Scripts/Mac/ $SCRIPTS/Mac/backup
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/backup-efi
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/copy-efi
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/disable-gatekeeper
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/mount-efi
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/reset-dock
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/restore
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/restore-efi
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/trim-enable

echo "Unpacking Files..."

unzip -o -qq Temp/Clover-Series-5.zip -d Clover/Series-5/
unzip -o -qq Temp/Clover-Series-6.zip -d Clover/Series-6/
unzip -o -qq Temp/Clover-Series-7.zip -d Clover/Series-7/
unzip -o -qq Temp/Clover-Series-8.zip -d Clover/Series-8/
unzip -o -qq Temp/Clover-Series-9.zip -d Clover/Series-9/

unzip -o -qq Temp/OpenCore-$OpenCoreVersion-RELEASE.zip -d OpenCore/Update/
unzip -o -qq Temp/OpenCore-Series-6.zip -d OpenCore/Series-6/
unzip -o -qq Temp/OpenCore-Series-7.zip -d OpenCore/Series-7/
unzip -o -qq Temp/OpenCore-Series-8.zip -d OpenCore/Series-8/
unzip -o -qq Temp/OpenCore-Series-9.zip -d OpenCore/Series-9/
unzip -o -qq Temp/OpenCore-Series-100.zip -d OpenCore/Series-100/
unzip -o -qq Temp/OpenCore-Series-200.zip -d OpenCore/Series-200/
unzip -o -qq Temp/OpenCore-Series-300.zip -d OpenCore/Series-300/
unzip -o -qq Temp/OpenCore-Series-400.zip -d OpenCore/Series-400/
unzip -o -qq Temp/OpenCore-Series-500.zip -d OpenCore/Series-500/

unzip -o -qq Temp/AirportBrcmFixup-2.1.3-RELEASE.zip -d Kexts/
unzip -o -qq Temp/AppleALC-1.6.3-RELEASE.zip -d Kexts/
unzip -o -qq Temp/AtherosE2200Ethernet-V2.2.2.zip -d Kexts/
unzip -o -qq Temp/IntelMausi-1.0.7-RELEASE.zip -d Kexts/
unzip -o -qq Temp/Lilu-1.5.5-RELEASE.zip -d Kexts/
unzip -o -qq Temp/RealtekRTL8111-V2.4.2.zip -d Kexts/
unzip -o -qq Temp/RestrictEvents-1.0.3-RELEASE.zip -d Kexts/
unzip -o -qq Temp/VirtualSMC-1.2.6-RELEASE.zip -d Kexts/
unzip -o -qq Temp/WhateverGreen-1.5.2-RELEASE.zip -d Kexts/

echo "Organising Files..."

rm -rf Clover/Series-5/__MACOSX
rm -rf Clover/Series-6/__MACOSX
rm -rf Clover/Series-7/__MACOSX
rm -rf Clover/Series-8/__MACOSX
rm -rf Clover/Series-9/__MACOSX

rm -rf OpenCore/Series-6/__MACOSX
rm -rf OpenCore/Series-7/__MACOSX
rm -rf OpenCore/Series-8/__MACOSX
rm -rf OpenCore/Series-9/__MACOSX
rm -rf OpenCore/Series-100/__MACOSX
rm -rf OpenCore/Series-200/__MACOSX
rm -rf OpenCore/Series-300/__MACOSX
rm -rf OpenCore/Series-400/__MACOSX
rm -rf OpenCore/Series-500/__MACOSX

cp -rf OpenCore/Update/X64/EFI OpenCore/Update/
rm -rf OpenCore/Update/Docs
rm -rf OpenCore/Update/IA32
rm -rf OpenCore/Update/Utilities
rm -rf OpenCore/Update/X64

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

mkdir -p Kexts/Kexts/VirtualSMC.kext/Contents/Plugins

rm -rf Kexts/AppleALCU.*
cp -rf Kexts/AtherosE2200Ethernet-V2.2.2/Release/AtherosE2200Ethernet.kext Kexts/
rm -rf Kexts/AtherosE2200Ethernet-V2.2.2
cp -rf Kexts/Kexts/SMCLightSensor.kext Kexts/Kexts/VirtualSMC.kext/Contents/Plugins/
cp -rf Kexts/Kexts/SMCProcessor.kext Kexts/Kexts/VirtualSMC.kext/Contents/Plugins/
cp -rf Kexts/Kexts/VirtualSMC.kext Kexts/
rm -rf Kexts/Kexts
cp -rf Kexts/RealtekRTL8111-V2.4.2/Release/RealtekRTL8111.kext Kexts/
rm -rf Kexts/RealtekRTL8111-V2.4.2
rm -rf Kexts/IntelSnowMausi.kext
rm -rf Kexts/*.dSYM
rm -rf Kexts/dSYM
rm -rf Kexts/__MACOSX
rm -rf Kexts/Tools
rm -rf Kexts/WhateverName.app
rm -f  Kexts/alc-verb

chmod -R +x Scripts/*
rm -rf Temp

echo "Done"

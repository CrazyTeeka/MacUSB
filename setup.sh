#!/bin/bash

OpenCore="0.6.8"

FILES="https://github.com/CrazyTeeka/MacUSB/raw/master/Files"
KEXTS="https://github.com/CrazyTeeka/MacUSB/raw/master/Kexts"
SCRIPTS="https://github.com/CrazyTeeka/MacUSB/raw/master/Scripts"

echo "OpenCore: $OpenCore"
echo ""

echo "Preparing..."

mkdir -p OpenCore
mkdir -p Docs
mkdir -p DSDT
mkdir -p Kexts
mkdir -p Scripts
mkdir -p Tools
mkdir -p Temp
mkdir -p Uploads

rm -rf OpenCore/*
rm -rf Docs/*
rm -rf DSDT/*
rm -rf Kexts/*
rm -rf Scripts/*
rm -rf Tools/*
rm -rf Temp/*
rm -rf Uploads/*

mkdir -p OpenCore/Series-9
mkdir -p OpenCore/Series-100
mkdir -p OpenCore/Series-200
mkdir -p OpenCore/Update

echo "Downloading Files..."

wget -q -P DSDT/ $FILES/DSDT-Asus-Maximus-VII-Hero-3503.aml
wget -q -P DSDT/ $FILES/DSDT-Asus-Maximus-VIII-Gene-1902.aml

wget -q -P Temp/ $FILES/OpenCore-$OpenCore-RELEASE.zip
wget -q -P Temp/ $FILES/OpenCore-Series-9.zip
wget -q -P Temp/ $FILES/OpenCore-Series-200.zip

wget -q -P Docs/ $FILES/OpenCore-Configuration.pdf
wget -q -P Tools/ $FILES/OpenCore-Configurator.zip

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

wget -q -P Scripts/ $SCRIPTS/install.sh
wget -q -P Scripts/ $SCRIPTS/run.sh

echo "Unpacking Files..."

unzip -o -qq Temp/OpenCore-$OpenCore-RELEASE.zip -d OpenCore/Update/
unzip -o -qq Temp/OpenCore-Series-9.zip -d OpenCore/Series-9/
unzip -o -qq Temp/OpenCore-Series-200.zip -d OpenCore/Series-100/
unzip -o -qq Temp/OpenCore-Series-200.zip -d OpenCore/Series-200/

unzip -o -qq Temp/AirportBrcmFixup-2.1.2-RELEASE.zip -d Kexts/
unzip -o -qq Temp/AppleALC-1.5.9-RELEASE.zip -d Kexts/
unzip -o -qq Temp/AtherosE2200Ethernet-V2.2.2.zip -d Kexts/
unzip -o -qq Temp/IntelMausi-1.0.5-RELEASE.zip -d Kexts/
unzip -o -qq Temp/Lilu-1.5.2-RELEASE.zip -d Kexts/
unzip -o -qq Temp/RealtekRTL8111-V2.4.0.zip -d Kexts/
unzip -o -qq Temp/RestrictEvents-1.0.0-RELEASE.zip -d Kexts/
unzip -o -qq Temp/VirtualSMC-1.2.2-RELEASE.zip -d Kexts/
unzip -o -qq Temp/WhateverGreen-1.4.9-RELEASE.zip -d Kexts/

echo "Organising Files..."

cp -rf OpenCore/Update/X64/EFI OpenCore/Update/

cp -f Temp/Tools-AppCleaner.zip Tools/AppCleaner.zip
cp -f Temp/Tools-PlistEditPro.zip Tools/PlistEditPro.zip
cp -f Temp/Tools-RunMe.zip Tools/RunMe.zip

cp -rf Kexts/AtherosE2200Ethernet-V2.2.2/Release/AtherosE2200Ethernet.kext Kexts/
rm -rf Kexts/AtherosE2200Ethernet-V2.2.2

mkdir -p Kexts/Kexts/VirtualSMC.kext/Contents/Plugins

cp -rf Kexts/Kexts/SMCLightSensor.kext Kexts/Kexts/VirtualSMC.kext/Contents/Plugins/
cp -rf Kexts/Kexts/SMCProcessor.kext Kexts/Kexts/VirtualSMC.kext/Contents/Plugins/
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

rm -rf Temp
echo "Done"

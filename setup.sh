#!/bin/bash

Clover="5133"
OpenCore="0.6.8"

FILES="https://github.com/CrazyTeeka/MacUSB/raw/master/Files"
KEXTS="https://github.com/CrazyTeeka/MacUSB/raw/master/Kexts"

echo "Clover:   $Clover"
echo "OpenCore: $OpenCore"
echo ""

echo "Preparing..."

mkdir -p Clover
mkdir -p OpenCore
mkdir -p DSDT
mkdir -p Kexts
mkdir -p Tools
mkdir -p Temp

rm -rf Clover/*
rm -rf OpenCore/*
rm -rf DSDT/*
rm -rf Kexts/*
rm -rf Tools/*
rm -rf Temp/*

mkdir -p Clover/Series-9
mkdir -p Clover/Update
mkdir -p OpenCore/Series-9
mkdir -p OpenCore/Update

echo "Downloading Files..."

wget -q -P Temp/ $FILES/CloverV2-$Clover.zip
wget -q -P Temp/ $FILES/Clover-Series-9.zip
wget -q -P Temp/ $FILES/Clover-Theme-Clovy.zip

wget -q -P Temp/ $FILES/Clover-DSDT-Asus-Maximus-VII-Hero-3503.aml
wget -q -P Temp/ $FILES/Clover-DSDT-Asus-Maximus-VIII-Gene-1902.aml

wget -q -P Temp/ $FILES/OpenCore-$OpenCore-RELEASE.zip
wget -q -P Temp/ $FILES/OpenCore-Series-9.zip

wget -q -P Temp/ $FILES/Clover-Configurator.zip
wget -q -P Temp/ $FILES/OpenCore-Configurator.zip

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

echo "Unpacking Files..."

unzip -o -qq Temp/CloverV2-$Clover.zip -d Clover/Update/
unzip -o -qq Temp/Clover-Series-9.zip -d Clover/Series-9/
unzip -o -qq Temp/Clover-Theme-Clovy.zip -d Clover/Series-9/EFI/CLOVER/themes/

unzip -o -qq Temp/OpenCore-$OpenCore-RELEASE.zip -d OpenCore/Update/
unzip -o -qq Temp/OpenCore-Series-9.zip -d OpenCore/Series-9/

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
cp -rf Clover/Update/CloverV2/EFI Clover/Update/
cp -rf OpenCore/Update/X64/EFI OpenCore/Update/

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

rm -rf Clover/Series-9/__MACOSX
rm -rf Clover/Update/CloverV2

rm -rf OpenCore/Series-9/__MACOSX
rm -rf OpenCore/Update/Docs
rm -rf OpenCore/Update/IA32
rm -rf OpenCore/Update/Utilities
rm -rf OpenCore/Update/X64

cp -f Temp/Clover-DSDT-Asus-Maximus-VII-Hero-3503.aml DSDT/
cp -f Temp/Clover-DSDT-Asus-Maximus-VIII-Gene-1902.aml DSDT/
cp -f Temp/Clover-Configurator.zip Tools/
cp -f Temp/OpenCore-Configurator.zip Tools/
cp -f Temp/Tools-AppCleaner.zip Tools/AppCleaner.zip
cp -f Temp/Tools-PlistEditPro.zip Tools/PlistEditPro.zip
cp -f Temp/Tools-RunMe.zip Tools/RunMe.zip

rm -rf Clover/Series-9/EFI/CLOVER/drivers/BIOS
rm -rf Clover/Series-9/EFI/CLOVER/misc
rm -rf Clover/Series-9/EFI/CLOVER/themes/Olarila

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

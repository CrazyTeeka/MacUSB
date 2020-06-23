#!/bin/bash

CLOVER="5119"

USER1="DESKTOPS.NEHALEM+"
USER2="DESKTOPS.SKYLAKE+"
USER3="NOTEBOOKS.NEHALEM+"
USER4="NOTEBOOKS.SKYLAKE+"

OLARILA1="CLOVER.SERIES.CHIPSET.zip"
OLARILA2="CLOVER.SERIES.100.200.300.zip"
OLARILA3="CLOVER.NOTEBOOKS.SERIES.CHIPSET.zip"
OLARILA4="CLOVER.NOTEBOOKS.100.200.300.zip"

AirportBrcmFixup="2.0.7"
AppleALC="1.5.0"
Lilu="1.4.5"
VirtualSMC="1.1.4"
WhateverGreen="1.4.0"

AppCleaner="3.5"

CheckFile() {
  if [ ! -f "$1" ]; then
    echo "EEP! $1 is missing."
  fi
}

CheckDir() {
  if [ ! -d "$1" ]; then
    echo "EEP! $1 is missing."
  fi
}

echo "Removing Folders..."
rm -rf Clover
rm -rf Clover.Folder
rm -rf Kexts
rm -rf Temp
rm -rf Tools

echo "Creating Folders..."
mkdir -p Clover/EFI/BOOT
mkdir -p Clover/EFI/CLOVER
mkdir -p Clover.Folder/$USER1
mkdir -p Clover.Folder/$USER2
mkdir -p Clover.Folder/$USER3
mkdir -p Clover.Folder/$USER4
mkdir -p Clover.Custom
mkdir -p Kexts
mkdir -p Temp/$USER1
mkdir -p Temp/$USER2
mkdir -p Temp/$USER3
mkdir -p Temp/$USER4
mkdir -p Tools

echo "Downloading Files..."
wget -q -P Temp/  https://github.com/CloverHackyColor/CloverBootloader/releases/download/$CLOVER/CloverV2-$CLOVER.zip
wget -q -P Temp/  https://www.olarila.com/files/Clover.Folder/$OLARILA1
wget -q -P Temp/  https://www.olarila.com/files/Clover.Folder/$OLARILA2
wget -q -P Temp/  https://www.olarila.com/files/Clover.Folder/$OLARILA3
wget -q -P Temp/  https://www.olarila.com/files/Clover.Folder/$OLARILA4
wget -q -P Tools/ https://www.olarila.com/files/Utils/RunMe.app.zip
wget -q -P Tools/ https://freemacsoft.net/downloads/AppCleaner_$AppCleaner.zip

echo "Unpacking Files..."
unzip -o -qq Temp/CloverV2-$CLOVER.zip -d Temp/
unzip -o -qq Temp/$OLARILA1            -d Temp/$USER1/
unzip -o -qq Temp/$OLARILA2            -d Temp/$USER2/
unzip -o -qq Temp/$OLARILA3            -d Temp/$USER3/
unzip -o -qq Temp/$OLARILA4            -d Temp/$USER4/

echo "Copying Files..."
cp -f  Temp/CloverV2/EFI/BOOT/BOOTX64.efi     Clover/EFI/BOOT/
cp -f  Temp/CloverV2/EFI/CLOVER/CLOVERX64.efi Clover/EFI/CLOVER/
cp -rf Temp/CloverV2/EFI/CLOVER/tools         Clover/EFI/CLOVER/
cp -rf Temp/$USER1/EFI                        Clover.Folder/$USER1/
cp -rf Temp/$USER2/EFI                        Clover.Folder/$USER2/
cp -rf Temp/$USER3/EFI                        Clover.Folder/$USER3/
cp -rf Temp/$USER4/EFI                        Clover.Folder/$USER4/
cp -rf Clover.Config/THEMES/Clovy             Clover.Folder/$USER1/EFI/CLOVER/themes/
cp -rf Clover.Config/THEMES/Clovy             Clover.Folder/$USER2/EFI/CLOVER/themes/
cp -rf Clover.Config/THEMES/Clovy             Clover.Folder/$USER3/EFI/CLOVER/themes/
cp -rf Clover.Config/THEMES/Clovy             Clover.Folder/$USER4/EFI/CLOVER/themes/

echo "Downloading Kexts..."
wget -q -P Temp/ https://github.com/acidanthera/AirportBrcmFixup/releases/download/$AirportBrcmFixup/AirportBrcmFixup-$AirportBrcmFixup-RELEASE.zip
wget -q -P Temp/ https://github.com/acidanthera/AppleALC/releases/download/$AppleALC/AppleALC-$AppleALC-RELEASE.zip
wget -q -P Temp/ https://github.com/acidanthera/Lilu/releases/download/$Lilu/Lilu-$Lilu-RELEASE.zip
wget -q -P Temp/ https://github.com/acidanthera/VirtualSMC/releases/download/$VirtualSMC/VirtualSMC-$VirtualSMC-RELEASE.zip
wget -q -P Temp/ https://github.com/acidanthera/WhateverGreen/releases/download/$WhateverGreen/WhateverGreen-$WhateverGreen-RELEASE.zip

echo "Unpacking Kexts..."
unzip -o -qq Temp/AirportBrcmFixup-$AirportBrcmFixup-RELEASE.zip -d Temp/
unzip -o -qq Temp/AppleALC-$AppleALC-RELEASE.zip                 -d Temp/
unzip -o -qq Temp/Lilu-$Lilu-RELEASE.zip                         -d Temp/
unzip -o -qq Temp/VirtualSMC-$VirtualSMC-RELEASE.zip             -d Temp/
unzip -o -qq Temp/WhateverGreen-$WhateverGreen-RELEASE.zip       -d Temp/

echo "Copying Kexts..."
cp -rf Temp/AirportBrcmFixup.kext Kexts/
cp -rf Temp/AppleALC.kext         Kexts/
cp -rf Temp/Lilu.kext             Kexts/
cp -rf Temp/Kexts/VirtualSMC.kext Kexts/
cp -rf Temp/WhateverGreen.kext    Kexts/

echo "Default Clover Theme..."
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

echo "Verifying..."
CheckFile "Clover/EFI/BOOT/BOOTX64.efi"
CheckFile "Clover/EFI/CLOVER/tools/bdmesg.efi"
CheckFile "Clover/EFI/CLOVER/tools/Shell32.efi"
CheckFile "Clover/EFI/CLOVER/tools/Shell64.efi"
CheckFile "Clover/EFI/CLOVER/tools/Shell64U.efi"
CheckFile "Clover/EFI/CLOVER/CLOVERX64.efi"
CheckFile "Clover.Config/DSDT/MAXIMUS-VII-HERO-ASUS-3503.aml"
CheckFile "Clover.Config/DSDT/MAXIMUS-VIII-GENE-ASUS.aml"
CheckFile "Clover.Config/THEMES/Clovy/sound.wav"
CheckFile "Clover.Config/THEMES/Clovy/theme.svg"
CheckFile "Clover.Folder/$USER1/EFI/BOOT/BOOTX64.efi"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/ACPI/patched"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/drivers/BIOS/ApfsDriverLoader.efi"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/drivers/BIOS/FSInject.efi"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/drivers/BIOS/HFSPlus.efi"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/drivers/UEFI/AptioMemoryFix.efi"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/drivers/UEFI/FSInject.efi"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/drivers/UEFI/HFSPlus.efi"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/AirportBrcmFixup.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/AppleALC.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/AtherosE2200Ethernet.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/AtherosWiFiInjector.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/IntelMausiEthernet.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/Lilu.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/RealtekRTL8111.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/USBInjectAll.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/VirtualSMC.kext"
CheckDir  "Clover.Folder/$USER1/EFI/CLOVER/kexts/Other/WhateverGreen.kext"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/themes/Clovy/sound.wav"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/themes/Clovy/theme.svg"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/CLOVERX64.efi"
CheckFile "Clover.Folder/$USER1/EFI/CLOVER/config.plist"
CheckFile "Clover.Folder/$USER2/EFI/BOOT/BOOTX64.efi"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/ACPI/patched"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/drivers/BIOS/ApfsDriverLoader.efi"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/drivers/BIOS/FSInject.efi"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/drivers/BIOS/HFSPlus.efi"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/drivers/UEFI/AptioMemoryFix.efi"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/drivers/UEFI/FSInject.efi"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/drivers/UEFI/HFSPlus.efi"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/AirportBrcmFixup.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/AppleALC.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/AtherosE2200Ethernet.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/AtherosWiFiInjector.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/IntelMausiEthernet.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/Lilu.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/RealtekRTL8111.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/SmallTreeIntel82576.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/USBInjectAll.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/VirtualSMC.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/WhateverGreen.kext"
CheckDir  "Clover.Folder/$USER2/EFI/CLOVER/kexts/Other/XHCI-unsupported.kext"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/themes/Clovy/sound.wav"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/themes/Clovy/theme.svg"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/CLOVERX64.efi"
CheckFile "Clover.Folder/$USER2/EFI/CLOVER/config.plist"
CheckFile "Clover.Folder/$USER3/EFI/BOOT/BOOTX64.efi"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/ACPI/patched"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/drivers/BIOS/ApfsDriverLoader.efi"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/drivers/BIOS/FSInject.efi"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/drivers/BIOS/HFSPlus.efi"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/drivers/UEFI/AptioMemoryFix.efi"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/drivers/UEFI/FSInject.efi"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/drivers/UEFI/HFSPlus.efi"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/AirportBrcmFixup.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/AppleALC.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/AtherosE2200Ethernet.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/AtherosWiFiInjector.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/IntelMausiEthernet.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/Lilu.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/NoTouchID.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/RealtekRTL8100.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/RealtekRTL8111.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/SATA-unsupported.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/USBInjectAll.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/VirtualSMC.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/VoodooPS2Controller.kext"
CheckDir  "Clover.Folder/$USER3/EFI/CLOVER/kexts/Other/WhateverGreen.kext"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/themes/Clovy/sound.wav"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/themes/Clovy/theme.svg"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/CLOVERX64.efi"
CheckFile "Clover.Folder/$USER3/EFI/CLOVER/config.plist"
CheckFile "Clover.Folder/$USER4/EFI/BOOT/BOOTX64.efi"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/ACPI/patched"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/drivers/BIOS/ApfsDriverLoader.efi"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/drivers/BIOS/FSInject.efi"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/drivers/BIOS/HFSPlus.efi"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/drivers/UEFI/AptioMemoryFix.efi"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/drivers/UEFI/FSInject.efi"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/drivers/UEFI/HFSPlus.efi"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/AirportBrcmFixup.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/AppleALC.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/AtherosE2200Ethernet.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/AtherosWiFiInjector.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/IntelMausiEthernet.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/Lilu.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/NoTouchID.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/NVMeFix.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/RealtekRTL8100.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/RealtekRTL8111.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/SATA-unsupported.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/USBInjectAll.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/VirtualSMC.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/VoodooI2C.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/VoodooI2CHID.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/VoodooPS2Controller.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/WhateverGreen.kext"
CheckDir  "Clover.Folder/$USER4/EFI/CLOVER/kexts/Other/XHCI-unsupported.kext"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/themes/Clovy/sound.wav"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/themes/Clovy/theme.svg"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/CLOVERX64.efi"
CheckFile "Clover.Folder/$USER4/EFI/CLOVER/config.plist"
CheckFile "Scripts/install.sh"
CheckFile "Scripts/run.sh"
CheckFile "Tools/RunMe.app.zip"

echo "Done"

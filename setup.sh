#!/bin/bash

if [ -t 1 ]; then
   tty_escape() { printf "\033[%sm" "$1"; }
else
   tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

CLOVER="5117"
USER1="DESKTOPS.NEHALEM+"
USER2="DESKTOPS.SKYLAKE+"
USER3="NOTEBOOKS.NEHALEM+"
USER4="NOTEBOOKS.SKYLAKE+"
OLARILA1="CLOVER.SERIES.CHIPSET.zip"
OLARILA2="CLOVER.SERIES.100.200.300.zip"
OLARILA3="CLOVER.NOTEBOOKS.SERIES.CHIPSET.zip"
OLARILA4="CLOVER.NOTEBOOKS.100.200.300.zip"

CheckFile() {
   if [ ! -f "$1" ]; then
      echo "${tty_blue}==>${tty_red} EEP! $1 is missing${tty_reset}"
   fi
}

CheckDir() {
   if [ ! -d "$1" ]; then
      echo "${tty_blue}==>${tty_red} EEP! $1 is missing${tty_reset}"
   fi
}

echo "${tty_blue}==>${tty_bold} Removing Folders...${tty_reset}"
rm -rf Clover
rm -rf Clover.Config
rm -rf Clover.Folder
rm -rf Scripts
rm -rf Tools
rm -rf Temp

echo "${tty_blue}==>${tty_bold} Creating Folders...${tty_reset}"
mkdir -p Clover/EFI/BOOT
mkdir -p Clover/EFI/CLOVER
mkdir -p Clover.Config/DSDT
mkdir -p Clover.Config/THEMES
mkdir -p Clover.Folder/$USER1
mkdir -p Clover.Folder/$USER2
mkdir -p Clover.Folder/$USER3
mkdir -p Clover.Folder/$USER4
mkdir -p Clover.Custom
mkdir -p Scripts
mkdir -p Tools
mkdir -p Temp/$USER1
mkdir -p Temp/$USER2
mkdir -p Temp/$USER3
mkdir -p Temp/$USER4

echo "${tty_blue}==>${tty_bold} Downloading Files...${tty_reset}"
wget -q -P Temp/               https://github.com/CloverHackyColor/CloverBootloader/releases/download/$CLOVER/CloverV2-$CLOVER.zip
wget -q -P Temp/               https://github.com/CrazyTeeka/Clover-Themes/raw/master/Clovy.zip
wget -q -P Temp/               https://www.olarila.com/files/Clover.Folder/$OLARILA1
wget -q -P Temp/               https://www.olarila.com/files/Clover.Folder/$OLARILA2
wget -q -P Temp/               https://www.olarila.com/files/Clover.Folder/$OLARILA3
wget -q -P Temp/               https://www.olarila.com/files/Clover.Folder/$OLARILA4
wget -q -P Clover.Config/DSDT/ https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VII-HERO-ASUS-3503.aml
wget -q -P Clover.Config/DSDT/ https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VIII-GENE-ASUS.aml
wget -q -O Temp/Scripts.zip    https://github.com/CrazyTeeka/MacUSB-Scripts/archive/master.zip
wget -q -P Tools/              https://github.com/CrazyTeeka/MacUSB-Tools/raw/master/RunMe.app.zip

echo "${tty_blue}==>${tty_bold} Unpacking Files...${tty_reset}"
unzip -o -qq Temp/CloverV2-$CLOVER.zip -d Temp/
unzip -o -qq Temp/Clovy.zip            -d Clover.Config/THEMES/
unzip -o -qq Temp/Scripts.zip          -d Temp/
unzip -o -qq Temp/$OLARILA1            -d Temp/$USER1/
unzip -o -qq Temp/$OLARILA2            -d Temp/$USER2/
unzip -o -qq Temp/$OLARILA3            -d Temp/$USER3/
unzip -o -qq Temp/$OLARILA4            -d Temp/$USER4/

echo "${tty_blue}==>${tty_bold} Copying Files...${tty_reset}"
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
cp -rf Temp/MacUSB-Scripts-master/*           Scripts/

echo "${tty_blue}==>${tty_bold} Clovy Theme...${tty_reset}"
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' Clover.Folder/$USER1/EFI/CLOVER/config.plist
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' Clover.Folder/$USER2/EFI/CLOVER/config.plist
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' Clover.Folder/$USER3/EFI/CLOVER/config.plist
sed -i 's/<string>Olarila<\/string>/<string>Clovy<\/string>/g' Clover.Folder/$USER4/EFI/CLOVER/config.plist

echo "${tty_blue}==>${tty_bold} Cleaning Up...${tty_reset}"
rm -rf Clover.Folder/$USER1/EFI/CLOVER/themes/Olarila
rm -rf Clover.Folder/$USER2/EFI/CLOVER/themes/Olarila
rm -rf Clover.Folder/$USER3/EFI/CLOVER/themes/Olarila
rm -rf Clover.Folder/$USER4/EFI/CLOVER/themes/Olarila
rm -rf Temp

echo "${tty_blue}==>${tty_bold} Verifying...${tty_reset}"
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
CheckFile "Scripts/backup.sh"
CheckFile "Scripts/copy.sh"
CheckFile "Scripts/disable.sh"
CheckFile "Scripts/install.sh"
CheckFile "Scripts/mount.sh"
CheckFile "Scripts/remove.sh"
CheckFile "Scripts/reset.sh"
CheckFile "Scripts/restore.sh"
CheckFile "Scripts/setup.sh"
CheckFile "Tools/RunMe.app.zip"

echo "${tty_blue}==>${tty_bold} Done${tty_reset}"

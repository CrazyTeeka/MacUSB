#!/bin/bash

USER1="DESKTOPS.NEHALEM+"
USER2="DESKTOPS.SKYLAKE+"
USER3="NOTEBOOKS.NEHALEM+"
USER4="NOTEBOOKS.SKYLAKE+"

cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.Folder/$USER1/EFI/BOOT/
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.Folder/$USER1/EFI/CLOVER/
cp -rf Clover/EFI/CLOVER/tools         Clover.Folder/$USER1/EFI/CLOVER/

cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.Folder/$USER2/EFI/BOOT/
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.Folder/$USER2/EFI/CLOVER/
cp -rf Clover/EFI/CLOVER/tools         Clover.Folder/$USER2/EFI/CLOVER/

cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.Folder/$USER3/EFI/BOOT/
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.Folder/$USER3/EFI/CLOVER/
cp -rf Clover/EFI/CLOVER/tools         Clover.Folder/$USER3/EFI/CLOVER/

cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.Folder/$USER4/EFI/BOOT/
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.Folder/$USER4/EFI/CLOVER/
cp -rf Clover/EFI/CLOVER/tools         Clover.Folder/$USER4/EFI/CLOVER/

if [ -d "Clover.Custom/James" ]; then
cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.Custom/James/EFI/BOOT/
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.Custom/James/EFI/CLOVER/
cp -rf Clover/EFI/CLOVER/tools         Clover.Custom/James/EFI/CLOVER/
cp -rf Kexts/AirportBrcmFixup.kext     Clover.Custom/James/EFI/CLOVER/kexts/Other/
cp -rf Kexts/AppleALC.kext             Clover.Custom/James/EFI/CLOVER/kexts/Other/
cp -rf Kexts/Lilu.kext                 Clover.Custom/James/EFI/CLOVER/kexts/Other/
cp -rf Kexts/VirtualSMC.kext           Clover.Custom/James/EFI/CLOVER/kexts/Other/
cp -rf Kexts/WhateverGreen.kext        Clover.Custom/James/EFI/CLOVER/kexts/Other/
fi

if [ -d "Clover.Custom/Frank" ]; then
cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.Custom/Frank/EFI/BOOT/
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.Custom/Frank/EFI/CLOVER/
cp -rf Clover/EFI/CLOVER/tools         Clover.Custom/Frank/EFI/CLOVER/
cp -rf Kexts/AirportBrcmFixup.kext     Clover.Custom/Frank/EFI/CLOVER/kexts/Other/
cp -rf Kexts/AppleALC.kext             Clover.Custom/Frank/EFI/CLOVER/kexts/Other/
cp -rf Kexts/Lilu.kext                 Clover.Custom/Frank/EFI/CLOVER/kexts/Other/
cp -rf Kexts/VirtualSMC.kext           Clover.Custom/Frank/EFI/CLOVER/kexts/Other/
cp -rf Kexts/WhateverGreen.kext        Clover.Custom/Frank/EFI/CLOVER/kexts/Other/
fi

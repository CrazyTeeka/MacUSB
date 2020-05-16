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

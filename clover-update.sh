#!/bin/bash

USER1="CLOVER.SERIES.CHIPSET"
USER2="CLOVER.SERIES.100.200.300"
USER3="CLOVER.NOTEBOOKS.SERIES.CHIPSET"
USER4="CLOVER.NOTEBOOKS.100.200.300"

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

#!/bin/bash

USER1="CLOVER.SERIES.CHIPSET"
USER2="CLOVER.SERIES.100.200.300"

cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.Folder/$USER1/EFI/BOOT/
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.Folder/$USER1/EFI/CLOVER/
cp -rf Clover/EFI/CLOVER/tools         Clover.Folder/$USER1/EFI/CLOVER/
cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.Folder/$USER2/EFI/BOOT/
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.Folder/$USER2/EFI/CLOVER/
cp -rf Clover/EFI/CLOVER/tools         Clover.Folder/$USER2/EFI/CLOVER/

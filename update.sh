#!/bin/bash

USER1=""
USER2=""

cp -f Clover/EFI/BOOT/BOOTX64.efi     Clover.User/$USER1/EFI/BOOT/
cp -f Clover/EFI/CLOVER/CLOVERX64.efi Clover.User/$USER1/EFI/CLOVER/
cp -f Clover/EFI/BOOT/BOOTX64.efi     Clover.User/$USER2/EFI/BOOT/
cp -f Clover/EFI/CLOVER/CLOVERX64.efi Clover.User/$USER2/EFI/CLOVER/

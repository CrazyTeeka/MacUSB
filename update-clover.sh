#!/bin/bash

Clover="5133"

rm    -rf "Temp"
mkdir -p  "Temp"

wget  -q -P  "Temp/" "https://github.com/CrazyTeeka/MacUSB/raw/master/Clover/CloverV2-$Clover.zip"
unzip -o -qq "Temp/CloverV2-$Clover.zip" -d "Temp/"

if [ -d "Clover/Series-9/EFI" ] && [ -d "Temp/CloverV2/EFI" ]; then
  cp -f "Temp/CloverV2/EFI/BOOT/BOOTX64.efi"                                        "Clover/Series-9/EFI/BOOT/BOOTX64.efi"
  cp -f "Temp/CloverV2/EFI/CLOVER/CLOVERX64.efi"                                    "Clover/Series-9/EFI/CLOVER/CLOVERX64.efi"
  cp -f "Temp/CloverV2/EFI/CLOVER/tools/bdmesg.efi"                                 "Clover/Series-9/EFI/CLOVER/tools/bdmesg.efi"
  cp -f "Temp/CloverV2/EFI/CLOVER/tools/ControlMsrE2.efi"                           "Clover/Series-9/EFI/CLOVER/tools/ControlMsrE2.efi"
  cp -f "Temp/CloverV2/EFI/CLOVER/tools/Shell32.efi"                                "Clover/Series-9/EFI/CLOVER/tools/Shell32.efi"
  cp -f "Temp/CloverV2/EFI/CLOVER/tools/Shell64.efi"                                "Clover/Series-9/EFI/CLOVER/tools/Shell64.efi"
  cp -f "Temp/CloverV2/EFI/CLOVER/tools/Shell64U.efi"                               "Clover/Series-9/EFI/CLOVER/tools/Shell64U.efi"
  cp -f "Temp/CloverV2/EFI/CLOVER/drivers/off/UEFI/FileSystem/ApfsDriverLoader.efi" "Clover/Series-9/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
  cp -f "Temp/CloverV2/EFI/CLOVER/drivers/off/UEFI/MemoryFix/OpenRuntime.efi"       "Clover/Series-9/EFI/CLOVER/drivers/UEFI/OpenRuntime.efi"
fi

rm -rf "Temp"

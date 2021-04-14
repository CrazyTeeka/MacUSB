#!/bin/bash

if [ -d "Clover/Series-9/EFI" ] && [ -d "Clover/Update/EFI" ]; then
  cp -f "Clover/Update/EFI/BOOT/BOOTX64.efi"                                        "Clover/Series-9/EFI/BOOT/BOOTX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/CLOVERX64.efi"                                    "Clover/Series-9/EFI/CLOVER/CLOVERX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/bdmesg.efi"                                 "Clover/Series-9/EFI/CLOVER/tools/bdmesg.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/ControlMsrE2.efi"                           "Clover/Series-9/EFI/CLOVER/tools/ControlMsrE2.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell32.efi"                                "Clover/Series-9/EFI/CLOVER/tools/Shell32.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64.efi"                                "Clover/Series-9/EFI/CLOVER/tools/Shell64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64U.efi"                               "Clover/Series-9/EFI/CLOVER/tools/Shell64U.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/FileSystem/ApfsDriverLoader.efi" "Clover/Series-9/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/MemoryFix/OpenRuntime.efi"       "Clover/Series-9/EFI/CLOVER/drivers/UEFI/OpenRuntime.efi"
fi

if [ -d "Clover/Series-100/EFI" ] && [ -d "Clover/Update/EFI" ]; then
  cp -f "Clover/Update/EFI/BOOT/BOOTX64.efi"                                        "Clover/Series-100/EFI/BOOT/BOOTX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/CLOVERX64.efi"                                    "Clover/Series-100/EFI/CLOVER/CLOVERX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/bdmesg.efi"                                 "Clover/Series-100/EFI/CLOVER/tools/bdmesg.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/ControlMsrE2.efi"                           "Clover/Series-100/EFI/CLOVER/tools/ControlMsrE2.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell32.efi"                                "Clover/Series-100/EFI/CLOVER/tools/Shell32.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64.efi"                                "Clover/Series-100/EFI/CLOVER/tools/Shell64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64U.efi"                               "Clover/Series-100/EFI/CLOVER/tools/Shell64U.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/FileSystem/ApfsDriverLoader.efi" "Clover/Series-100/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/MemoryFix/OpenRuntime.efi"       "Clover/Series-100/EFI/CLOVER/drivers/UEFI/OpenRuntime.efi"
fi

if [ -d "Clover/Series-200/EFI" ] && [ -d "Clover/Update/EFI" ]; then
  cp -f "Clover/Update/EFI/BOOT/BOOTX64.efi"                                        "Clover/Series-200/EFI/BOOT/BOOTX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/CLOVERX64.efi"                                    "Clover/Series-200/EFI/CLOVER/CLOVERX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/bdmesg.efi"                                 "Clover/Series-200/EFI/CLOVER/tools/bdmesg.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/ControlMsrE2.efi"                           "Clover/Series-200/EFI/CLOVER/tools/ControlMsrE2.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell32.efi"                                "Clover/Series-200/EFI/CLOVER/tools/Shell32.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64.efi"                                "Clover/Series-200/EFI/CLOVER/tools/Shell64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64U.efi"                               "Clover/Series-200/EFI/CLOVER/tools/Shell64U.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/FileSystem/ApfsDriverLoader.efi" "Clover/Series-200/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/MemoryFix/OpenRuntime.efi"       "Clover/Series-200/EFI/CLOVER/drivers/UEFI/OpenRuntime.efi"
fi

if [ -d "Clover/Series-300/EFI" ] && [ -d "Clover/Update/EFI" ]; then
  cp -f "Clover/Update/EFI/BOOT/BOOTX64.efi"                                        "Clover/Series-300/EFI/BOOT/BOOTX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/CLOVERX64.efi"                                    "Clover/Series-300/EFI/CLOVER/CLOVERX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/bdmesg.efi"                                 "Clover/Series-300/EFI/CLOVER/tools/bdmesg.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/ControlMsrE2.efi"                           "Clover/Series-300/EFI/CLOVER/tools/ControlMsrE2.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell32.efi"                                "Clover/Series-300/EFI/CLOVER/tools/Shell32.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64.efi"                                "Clover/Series-300/EFI/CLOVER/tools/Shell64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64U.efi"                               "Clover/Series-300/EFI/CLOVER/tools/Shell64U.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/FileSystem/ApfsDriverLoader.efi" "Clover/Series-300/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/MemoryFix/OpenRuntime.efi"       "Clover/Series-300/EFI/CLOVER/drivers/UEFI/OpenRuntime.efi"
fi

if [ -d "Clover/Series-400/EFI" ] && [ -d "Clover/Update/EFI" ]; then
  cp -f "Clover/Update/EFI/BOOT/BOOTX64.efi"                                        "Clover/Series-400/EFI/BOOT/BOOTX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/CLOVERX64.efi"                                    "Clover/Series-400/EFI/CLOVER/CLOVERX64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/bdmesg.efi"                                 "Clover/Series-400/EFI/CLOVER/tools/bdmesg.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/ControlMsrE2.efi"                           "Clover/Series-400/EFI/CLOVER/tools/ControlMsrE2.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell32.efi"                                "Clover/Series-400/EFI/CLOVER/tools/Shell32.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64.efi"                                "Clover/Series-400/EFI/CLOVER/tools/Shell64.efi"
  cp -f "Clover/Update/EFI/CLOVER/tools/Shell64U.efi"                               "Clover/Series-400/EFI/CLOVER/tools/Shell64U.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/FileSystem/ApfsDriverLoader.efi" "Clover/Series-400/EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi"
  cp -f "Clover/Update/EFI/CLOVER/drivers/off/UEFI/MemoryFix/OpenRuntime.efi"       "Clover/Series-400/EFI/CLOVER/drivers/UEFI/OpenRuntime.efi"
fi

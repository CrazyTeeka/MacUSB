#!/bin/bash

OpenCore="0.6.8"

rm    -rf "Temp"
mkdir -p  "Temp/OpenCore"

wget  -q -P  "Temp/" "https://github.com/CrazyTeeka/MacUSB/blob/master/OpenCore/OpenCore-$OpenCore-RELEASE.zip?raw=true"
unzip -o -qq "Temp/OpenCore-$OpenCore-RELEASE.zip?raw=true" -d "Temp/OpenCore/"

if [ -d "OpenCore/Series-9/EFI" ] && [ -d "Temp/OpenCore/X64/EFI" ]; then
  cp -f "Temp/OpenCore/X64/EFI/BOOT/BOOTx64.efi"               "OpenCore/Series-9/EFI/BOOT/BOOTx64.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Drivers/CrScreenshotDxe.efi" "OpenCore/Series-9/EFI/OC/Drivers/CrScreenshotDxe.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Drivers/NvmExpressDxe.efi"   "OpenCore/Series-9/EFI/OC/Drivers/NvmExpressDxe.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Drivers/OpenCanopy.efi"      "OpenCore/Series-9/EFI/OC/Drivers/OpenCanopy.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Drivers/OpenRuntime.efi"     "OpenCore/Series-9/EFI/OC/Drivers/OpenRuntime.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/BootKicker.efi"        "OpenCore/Series-9/EFI/OC/Tools/BootKicker.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/ChipTune.efi"          "OpenCore/Series-9/EFI/OC/Tools/ChipTune.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/CleanNvram.efi"        "OpenCore/Series-9/EFI/OC/Tools/CleanNvram.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/ControlMsrE2.efi"      "OpenCore/Series-9/EFI/OC/Tools/ControlMsrE2.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/GopStop.efi"           "OpenCore/Series-9/EFI/OC/Tools/GopStop.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/KeyTester.efi"         "OpenCore/Series-9/EFI/OC/Tools/KeyTester.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/MmapDump.efi"          "OpenCore/Series-9/EFI/OC/Tools/MmapDump.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/OpenControl.efi"       "OpenCore/Series-9/EFI/OC/Tools/OpenControl.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/OpenShell.efi"         "OpenCore/Series-9/EFI/OC/Tools/OpenShell.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/ResetSystem.efi"       "OpenCore/Series-9/EFI/OC/Tools/ResetSystem.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/Tools/RtcRw.efi"             "OpenCore/Series-9/EFI/OC/Tools/RtcRw.efi"
  cp -f "Temp/OpenCore/X64/EFI/OC/OpenCore.efi"                "OpenCore/Series-9/EFI/OC/OpenCore.efi"
fi

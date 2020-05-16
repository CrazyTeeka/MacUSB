# MacUSB
Simple toolkit for **Linux** that makes a USB flash media bootable installer for **macOS** on a regular PC computer.

## Download
Open a terminal then use:
```
wget -O MacUSB.zip https://github.com/CrazyTeeka/MacUSB/archive/master.zip
```

## Setup
Open a terminal then use:
```
mv MacUSB-master MacUSB
cd MacUSB
sh setup.sh
```
After using **setup.sh** the folder layout should look like this:
```
MacUSB
MacUSB/Clover
MacUSB/Clover/EFI
MacUSB/Clover/EFI/BOOT
MacUSB/Clover/EFI/CLOVER
MacUSB/Clover.Config
MacUSB/Clover.Config/CONFIG
MacUSB/Clover.Config/DSDT
MacUSB/Clover.Config/THEMES
MacUSB/Clover.Folder
MacUSB/Clover.Folder/CLOVER.SERIES.100.200.300
MacUSB/Clover.Folder/CLOVER.SERIES.100.200.300/EFI
MacUSB/Clover.Folder/CLOVER.SERIES.100.200.300/EFI/BOOT
MacUSB/Clover.Folder/CLOVER.SERIES.100.200.300/EFI/CLOVER
MacUSB/Clover.Folder/CLOVER.SERIES.CHIPSET
MacUSB/Clover.Folder/CLOVER.SERIES.CHIPSET/EFI
MacUSB/Clover.Folder/CLOVER.SERIES.CHIPSET/EFI/BOOT
MacUSB/Clover.Folder/CLOVER.SERIES.CHIPSET/EFI/CLOVER
MacUSB/Scripts
MacUSB/Tools
```

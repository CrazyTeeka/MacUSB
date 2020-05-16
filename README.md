# MacUSB
Simple toolkit for **Linux** that makes a USB flash media bootable installer for **macOS** on a regular PC computer.

## How To Download
Open a terminal then use:
```
wget -O MacUSB.zip https://github.com/CrazyTeeka/MacUSB/archive/master.zip
```

## How To Setup
Open a terminal then use:
```
unzip MacUSB.zip && mv MacUSB-master MacUSB && cd MacUSB && sh setup.sh
```
The directory/file structure should look like:
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
MacUSB/download.sh
MacUSB/macOS.gdisk
MacUSB/make.sh
MacUSB/README.md
MacUSB/setup.sh
MacUSB/update.sh
```

## How To Use

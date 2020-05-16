# MacUSB
Simple toolkit for **Linux** that makes a USB flash media bootable installer for **macOS** on a regular PC computer.
```
Credits: MaLd0n from Olarila.com for working Clover EFI folders and custom DSDT's.
```

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
When **setup.sh** has finished. The **MacUSB** folder should look like this:
```
MacUSB
├───Clover
├──────EFI
├─────────BOOT
├─────────CLOVER
├───Clover.Config
├──────CONFIG
├──────DSDT
├──────THEMES
├───Clover.Folder
├──────CLOVER.NOTEBOOKS.100.200.300
├─────────EFI
├────────────BOOT
├────────────CLOVER
├──────CLOVER.NOTEBOOKS.SERIES.CHIPSET
├─────────EFI
├────────────BOOT
├────────────CLOVER
├──────CLOVER.SERIES.100.200.300
├─────────EFI
├────────────BOOT
├────────────CLOVER
├──────CLOVER.SERIES.CHIPSET
├─────────EFI
├────────────BOOT
├────────────CLOVER
├───Scripts
├───Tools
├───clover-update.sh
├───download.sh
├───macOS.gdisk
├───make.sh
├───README.md
└───setup.sh
```

## How To Use
Download macOS 10.15.4:
```
sh download.sh 10.15.4
```
Intel Series 5 6 7 8 9 (NEHALEM / SANDY BRIDGE / IVY BRIDGE / HASWELL / BROADWELL):
```
sh make.sh /dev/sdb 10.15.4 Clover.Folder/CLOVER.SERIES.CHIPSET
```
Intel Series 10 20 30 (SKYLAKE / KABYLAKE / COFFEELAKE / WHISKEYLAKE / COMETLAKE):
```
sh make.sh /dev/sdb 10.15.4 Clover.Folder/CLOVER.SERIES.100.200.300
```
Intel Series 5 6 7 8 9 - NOTEBOOKS/LAPTOPS:
```
sh make.sh /dev/sdb 10.15.4 Clover.Folder/CLOVER.NOTEBOOKS.SERIES.CHIPSET
```
Intel Series 10 20 30 - NOTEBOOKS/LAPTOPS:
```
sh make.sh /dev/sdb 10.15.4 Clover.Folder/CLOVER.NOTEBOOKS.100.200.300
```

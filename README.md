# MacUSB
Create **Bootable Flash Media** with Linux. Install **macOS** on any Desktop or Laptop computer.
```
Credits: MaLd0n from Olarila.com for the EFI folders and custom DSDTs.
```

## Install MacUSB
```
wget -O MacUSB.zip https://github.com/CrazyTeeka/MacUSB/archive/master.zip
unzip MacUSB.zip && mv MacUSB-master MacUSB && cd MacUSB && sh setup.sh
```

## Download macOS
```
sh download.sh 10.15.4
```

## Create Bootable Flash Media
DESKTOPS - (NEHALEM / SANDY BRIDGE / IVY BRIDGE / HASWELL / BROADWELL):
```
sh make.sh /dev/sdb 10.15.4 Clover.Folder/CLOVER.SERIES.CHIPSET
```
DESKTOPS - (SKYLAKE / KABYLAKE / COFFEELAKE / WHISKEYLAKE / COMETLAKE):
```
sh make.sh /dev/sdb 10.15.4 Clover.Folder/CLOVER.SERIES.100.200.300
```
NOTEBOOKS - (NEHALEM / SANDY BRIDGE / IVY BRIDGE / HASWELL / BROADWELL):
```
sh make.sh /dev/sdb 10.15.4 Clover.Folder/CLOVER.NOTEBOOKS.SERIES.CHIPSET
```
NOTEBOOKS - (SKYLAKE / KABYLAKE / COFFEELAKE / WHISKEYLAKE / COMETLAKE):
```
sh make.sh /dev/sdb 10.15.4 Clover.Folder/CLOVER.NOTEBOOKS.100.200.300
```

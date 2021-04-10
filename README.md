# MacUSB
Create **Bootable Flash Media** with Linux. Install **macOS** on any desktop computer.

## Install MacUSB
```
wget -O MacUSB.zip https://github.com/CrazyTeeka/MacUSB/archive/master.zip
unzip MacUSB.zip && mv MacUSB-master MacUSB && cd MacUSB && sh setup.sh
```

## Download macOS
```
sh download.sh 10.15.7
```

## Create Bootable Flash Media
DESKTOPS - (NEHALEM / SANDY BRIDGE / IVY BRIDGE / HASWELL / BROADWELL):
```
sh make.sh /dev/sdb 10.15.7 Clover.Folder/DESKTOPS.NEHALEM+
```

# MacUSB
Create **Bootable Flash Media** with Linux. Install **macOS** on any desktop computer.

### Install MacUSB
```
wget -O MacUSB.zip https://github.com/CrazyTeeka/MacUSB/archive/master.zip
unzip MacUSB.zip && mv MacUSB-master MacUSB && cd MacUSB && sh setup.sh
```

### Download macOS
```
sh download.sh Catalina
```

### Create Bootable Flash Media
```
sh make.sh /dev/sdb Catalina OpenCore/Series-9
```

# MacUSB
Hackintosh Toolkit for Linux

#### Install MacUSB:
```
wget -O MacUSB.zip https://github.com/CrazyTeeka/MacUSB/archive/master.zip && unzip MacUSB.zip && mv MacUSB-master MacUSB && cd MacUSB && sh setup.sh
```

#### Download macOS:
```
sh download.sh Catalina
sh download.sh Mojave
sh download.sh HighSierra
```

#### Create Bootable Flash Media:
```
sh make.sh /dev/sdb Catalina OpenCore/Series-9
sh make.sh /dev/sdb Catalina OpenCore/Series-100
sh make.sh /dev/sdb Catalina OpenCore/Series-200
sh make.sh /dev/sdb Catalina OpenCore/Series-300
sh make.sh /dev/sdb Catalina OpenCore/Series-400
sh make.sh /dev/sdb Catalina OpenCore/Series-500
```

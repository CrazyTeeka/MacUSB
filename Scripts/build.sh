#!/bin/bash

clear

rm -rf $HOME/Desktop/Build
rm -rf $HOME/Desktop/Kexts
rm -rf $HOME/Desktop/OpenCore

sleep 5

mkdir -p $HOME/Desktop/Kexts
mkdir -p $HOME/Desktop/OpenCore
mkdir -p $HOME/Desktop/Build/Temp
cd       $HOME/Desktop/Build

git clone https://github.com/acidanthera/AirportBrcmFixup.git
git clone https://github.com/acidanthera/AppleALC.git
git clone https://github.com/acidanthera/IntelMausi.git
git clone https://github.com/acidanthera/Lilu.git
git clone https://github.com/acidanthera/MacKernelSDK.git
git clone https://github.com/acidanthera/OpenCorePkg.git
git clone https://github.com/acidanthera/RestrictEvents.git
git clone https://github.com/acidanthera/VirtualSMC.git
git clone https://github.com/acidanthera/WhateverGreen.git
git clone https://github.com/Mieze/AtherosE2200Ethernet.git
git clone https://github.com/Mieze/RTL8111_driver_for_OS_X.git

cp -r ./MacKernelSDK ./AirportBrcmFixup/
cp -r ./MacKernelSDK ./AppleALC/
cp -r ./MacKernelSDK ./IntelMausi/
cp -r ./MacKernelSDK ./Lilu/
cp -r ./MacKernelSDK ./RestrictEvents/
cp -r ./MacKernelSDK ./VirtualSMC/
cp -r ./MacKernelSDK ./WhateverGreen/
cp -r ./MacKernelSDK ./AtherosE2200Ethernet/
cp -r ./MacKernelSDK ./RTL8111_driver_for_OS_X/

xcodebuild -project Lilu/Lilu.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp

cp -r ./Temp/Lilu.kext ./AirportBrcmFixup/
cp -r ./Temp/Lilu.kext ./AppleALC/
cp -r ./Temp/Lilu.kext ./IntelMausi/
cp -r ./Temp/Lilu.kext ./RestrictEvents/
cp -r ./Temp/Lilu.kext ./VirtualSMC/
cp -r ./Temp/Lilu.kext ./WhateverGreen/
cp -r ./Temp/Lilu.kext ./AtherosE2200Ethernet/
cp -r ./Temp/Lilu.kext ./RTL8111_driver_for_OS_X/

xcodebuild -project AirportBrcmFixup/AirportBrcmFixup.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp
xcodebuild -project AppleALC/AppleALC.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp
xcodebuild -project IntelMausi/IntelMausiEthernet.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp
xcodebuild -project RestrictEvents/RestrictEvents.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp
xcodebuild -project VirtualSMC/VirtualSMC.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp
xcodebuild -project WhateverGreen/WhateverGreen.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp
xcodebuild -project AtherosE2200Ethernet/AtherosE2200Ethernet.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp
xcodebuild -project RTL8111_driver_for_OS_X/RealtekRTL8111.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Temp

cd $HOME/Desktop/Build/OpenCorePkg/
./build_oc.tool

cd $HOME/Desktop
cp -r ./Build/Temp/*.kext ./Kexts/
cp -r ./Build/OpenCorePkg/Binaries/* ./OpenCore/

rm -rf Build

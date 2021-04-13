#!/bin/bash

rm    -rf $HOME/Desktop/Build
mkdir -p  $HOME/Desktop/Build/Release
cd        $HOME/Desktop/Build

#git clone https://github.com/acidanthera/AirportBrcmFixup
#git clone https://github.com/acidanthera/AppleALC
#git clone https://github.com/acidanthera/BT4LEContinuityFixup
#git clone https://github.com/acidanthera/CPUFriend
#git clone https://github.com/acidanthera/DebugEnhancer
#git clone https://github.com/acidanthera/HibernationFixup
#git clone https://github.com/acidanthera/IntelMausi
git clone https://github.com/acidanthera/Lilu
git clone https://github.com/acidanthera/MacKernelSDK
#git clone https://github.com/acidanthera/NVMeFix
#git clone https://github.com/acidanthera/OpenCorePkg
#git clone https://github.com/acidanthera/RTCMemoryFixup
#git clone https://github.com/acidanthera/VirtualSMC
#git clone https://github.com/acidanthera/VoodooInput
#git clone https://github.com/acidanthera/VoodooPS2
#git clone https://github.com/acidanthera/WhateverGreen
#git clone https://github.com/hieplpvip/AppleBacklightSmoother
#git clone https://github.com/hieplpvip/SidecarEnabler
#git clone https://github.com/lvs1974/CpuTscSync
#git clone https://github.com/Mieze/AtherosE2200Ethernet
#git clone https://github.com/Mieze/RealtekRTL8100
#git clone https://github.com/Mieze/RTL8111_driver_for_OS_X

#cd $HOME/Desktop/Build/VoodooPS2
#git clone https://github.com/acidanthera/VoodooInput

cd $HOME/Desktop/Build
#cp -r MacKernelSDK Lilu/

xcodebuild -project Lilu/Lilu.xcodeproj -configuration Release clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Release
#xcodebuild -project ./VoodooInput/VoodooInput.xcodeproj -configuration Debug clean build ARCHS=x86_64 ONLY_ACTIVE_ARCH=YES CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Release

#cd $HOME/Desktop/Build
#cp -r ./Release/VoodooInput.kext ./VoodooPS2

#cd $HOME/Desktop/Build
#cp -r ./Release/Lilu.kext ./AirportBrcmFixup
#cp -r ./Release/Lilu.kext ./AppleALC
#cp -r ./Release/Lilu.kext ./AppleBacklightSmoother
#cp -r ./Release/Lilu.kext ./BT4LEContinuityFixup
#cp -r ./Release/Lilu.kext ./CPUFriend
#cp -r ./Release/Lilu.kext ./CpuTscSync
#cp -r ./Release/Lilu.kext ./DebugEnhancer
#cp -r ./Release/Lilu.kext ./HibernationFixup
#cp -r ./Release/Lilu.kext ./IntelMausi
#cp -r ./Release/Lilu.kext ./NVMeFix
#cp -r ./Release/Lilu.kext ./RTCMemoryFixup
#cp -r ./Release/Lilu.kext ./SidecarEnabler
#cp -r ./Release/Lilu.kext ./VirtualSMC
#cp -r ./Release/Lilu.kext ./VoodooInput
#cp -r ./Release/Lilu.kext ./WhateverGreen

#cd $HOME/Desktop/Build
#cp -r ./MacKernelSDK ./AirportBrcmFixup
#cp -r ./MacKernelSDK ./AppleALC
#cp -r ./MacKernelSDK ./AppleBacklightSmoother
#cp -r ./MacKernelSDK ./BT4LEContinuityFixup
#cp -r ./MacKernelSDK ./CPUFriend
#cp -r ./MacKernelSDK ./CpuTscSync
#cp -r ./MacKernelSDK ./DebugEnhancer
#cp -r ./MacKernelSDK ./HibernationFixup
#cp -r ./MacKernelSDK ./IntelMausi
#cp -r ./MacKernelSDK ./NVMeFix
#cp -r ./MacKernelSDK ./RTCMemoryFixup
#cp -r ./MacKernelSDK ./SidecarEnabler
#cp -r ./MacKernelSDK ./VirtualSMC
#cp -r ./MacKernelSDK ./VoodooInput
#cp -r ./MacKernelSDK ./VoodooPS2
#cp -r ./MacKernelSDK ./WhateverGreen

#xcodebuild CONFIGURATION_BUILD_DIR=$HOME/Desktop/Build/Release

#cd $HOME/Desktop/Build/AirportBrcmFixup/
#cd $HOME/Desktop/Build/AppleALC/
#cd $HOME/Desktop/Build/AppleBacklightSmoother/
#cd $HOME/Desktop/Build/AtherosE2200Ethernet/
#cd $HOME/Desktop/Build/BT4LEContinuityFixup/
#cd $HOME/Desktop/Build/CPUFriend/
#cd $HOME/Desktop/Build/CpuTscSync/
#cd $HOME/Desktop/Build/DebugEnhancer/
#cd $HOME/Desktop/Build/HibernationFixup/
#cd $HOME/Desktop/Build/IntelMausi/
#cd $HOME/Desktop/Build/NVMeFix/
#cd $HOME/Desktop/Build/RealtekRTL8100/
#cd $HOME/Desktop/Build/RTCMemoryFixup/
#cd $HOME/Desktop/Build/RTL8111_driver_for_OS_X/
#cd $HOME/Desktop/Build/SidecarEnabler/
#cd $HOME/Desktop/Build/VirtualSMC/
#cd $HOME/Desktop/Build/VoodooInput/
#cd $HOME/Desktop/Build/VoodooPS2/
#cd $HOME/Desktop/Build/WhateverGreen/

#cd $HOME/Desktop/Build/OpenCorePkg/
#./build_oc.tool

#cd $HOME/Desktop/Build/Release
#rm -rf DeviceGenerator
#rm -rf *.dsl
#rm -rf *dSYM
#rm -rf *.dSYM
#rm -rf libaistat.dylib
#rm -rf package
#rm -rf ResourceConverter
#rm -rf rtcread
#rm -rf smc
#rm -rf smcread
#rm -rf *.zip

#mv $HOME/Desktop/Build/Release $HOME/Desktop/
#mv $HOME/Desktop/Build/OpenCorePkg/Binaries/* $HOME/Desktop/Release/OpenCore/
#cd $HOME/Desktop

#rm -rf Build

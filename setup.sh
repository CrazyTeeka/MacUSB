#!/bin/bash

# Clover Build
clover="5117"

# Assign Clover Folders
user1="CLOVER.SERIES.CHIPSET"
user2="CLOVER.SERIES.100.200.300"

# Create Folders
mkdir -p Clover/EFI/BOOT
mkdir -p Clover/EFI/CLOVER
mkdir -p Clover.Config/Config
mkdir -p Clover.Config/DSDT
mkdir -p Clover.Config/Themes/Clovy
mkdir -p Clover.User/$user1/EFI
mkdir -p Clover.User/$user2/EFI
mkdir -p Scripts
mkdir -p Tools
mkdir -p Temp

# Rerun CleanUp
rm -rf Clover/EFI/BOOT/*
rm -rf Clover/EFI/CLOVER/*
rm -rf Clover.Config/Config/*
rm -rf Clover.Config/DSDT/*
rm -rf Clover.Config/Themes/*
rm -rf Scripts/*
rm -rf Tools/*
rm -rf Temp/*

# Download Clover
wget  -q -P  Temp/ https://github.com/CloverHackyColor/CloverBootloader/releases/download/$clover/CloverV2-$clover.zip
unzip -o -qq Temp/CloverV2-$clover.zip -d Temp/

# Copy Clover
cp -f  Temp/CloverV2/EFI/BOOT/BOOTX64.efi     Clover/EFI/BOOT/
cp -f  Temp/CloverV2/EFI/CLOVER/CLOVERX64.efi Clover/EFI/CLOVER/
cp -rf Temp/CloverV2/EFI/CLOVER/drivers       Clover/EFI/CLOVER/
cp -rf Temp/CloverV2/EFI/CLOVER/tools         Clover/EFI/CLOVER/

# Download DSDT Library
wget -q -P Clover.Config/DSDT/ https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VII-HERO-ASUS-3503.aml
wget -q -P Clover.Config/DSDT/ https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VIII-GENE-ASUS.aml

# Download Clovy Theme
wget  -q -P  Temp/ https://github.com/CrazyTeeka/Clover-Themes/raw/master/Clovy.zip
unzip -o -qq Temp/Clovy.zip -d Clover.Config/Themes/

# Download Clover Folders
wget -q -P Temp/ https://www.olarila.com/files/Clover.Folder/$user1.zip
wget -q -P Temp/ https://www.olarila.com/files/Clover.Folder/$user2.zip

# Copy into Clover.User
mkdir -p Temp/$user1
mkdir -p Temp/$user2
unzip -o -qq Temp/$user1.zip -d Temp/$user1/
unzip -o -qq Temp/$user2.zip -d Temp/$user2/
cp -rf Temp/$user1/EFI Clover.User/$user1/
cp -rf Temp/$user2/EFI Clover.User/$user2/

# Copy theme into Clover.User
cp -rf Clover.Config/Themes/Clovy Clover.User/$user1/EFI/CLOVER/themes/
cp -rf Clover.Config/Themes/Clovy Clover.User/$user2/EFI/CLOVER/themes/

# Final CleanUp
rm -rf Clover.User/$user1/EFI/CLOVER/themes/Olarila
rm -rf Clover.User/$user2/EFI/CLOVER/themes/Olarila

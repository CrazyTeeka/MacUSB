#!/bin/bash

mkdir -p Clover/5116/EFI
mkdir -p Clover.Config/Config
mkdir -p Clover.Config/DSDT
mkdir -p Clover.Config/Themes/Clovy
mkdir -p Clover.User/James/EFI
mkdir -p Clover.User/Frank/EFI
mkdir -p Scripts
mkdir -p Tools
mkdir -p Temp

rm -rf Clover.Config/Config/*
rm -rf Clover.Config/DSDT/*
rm -rf Clover.Config/Themes/*

wget -q -P Clover.Config/DSDT/ https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VII-HERO-ASUS-3503.aml
wget -q -P Clover.Config/DSDT/ https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VIII-GENE-ASUS.aml

wget -q -P Temp/ https://github.com/CrazyTeeka/Clover-Themes/raw/master/Clovy.zip
unzip -o -qq Temp/Clovy.zip -d Clover.Config/Themes/

wget -q -P Temp/ https://www.olarila.com/files/Clover.Folder/CLOVER.SERIES.CHIPSET.zip
unzip -o -qq Temp/CLOVER.SERIES.CHIPSET.zip -d Temp/
cp -rf Temp/EFI Clover.User/James/
rm -rf Clover.User/James/EFI/CLOVER/themes/*

rm -rf Temp/*

wget -q -P Temp/ https://www.olarila.com/files/Clover.Folder/CLOVER.SERIES.100.200.300.zip
unzip -o -qq Temp/CLOVER.SERIES.100.200.300.zip -d Temp/
cp -rf Temp/EFI Clover.User/Frank/
rm -rf Clover.User/Frank/EFI/CLOVER/themes/*

rm -rf Temp

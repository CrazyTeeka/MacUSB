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

wget -q -O Temp/Clovy.zip https://github.com/CrazyTeeka/Clover-Themes/raw/master/Clovy.zip
unzip -o -qq Temp/Clovy.zip -d Clover.Config/Themes/

wget -q -O Clover.Config/DSDT/MAXIMUS-VII-HERO-ASUS-3503.aml https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VII-HERO-ASUS-3503.aml
wget -q -O Clover.Config/DSDT/MAXIMUS-VIII-GENE-ASUS.aml https://github.com/CrazyTeeka/Clover-DSDT/raw/master/MAXIMUS-VIII-GENE-ASUS.aml

rm -rf Temp

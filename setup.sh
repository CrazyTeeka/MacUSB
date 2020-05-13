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

rm -rf Temp

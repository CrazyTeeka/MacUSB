#!/bin/bash

OPENCORE="https://github.com/CrazyTeeka/MacUSB/raw/master/OpenCore"
SCRIPTS="https://github.com/CrazyTeeka/MacUSB/raw/master/Scripts"

echo "Preparing Folders..."

mkdir -p OpenCore
mkdir -p Scripts
mkdir -p Temp

rm -rf OpenCore/*
rm -rf Scripts/*
rm -rf Temp/*

mkdir -p OpenCore/Series-6
mkdir -p OpenCore/Series-7
mkdir -p OpenCore/Series-8
mkdir -p OpenCore/Series-9
mkdir -p OpenCore/Series-100
mkdir -p OpenCore/Series-200
mkdir -p OpenCore/Series-300
mkdir -p OpenCore/Series-400
mkdir -p OpenCore/Series-500
mkdir -p OpenCore/Series-600

mkdir -p Scripts/Linux
mkdir -p Scripts/Mac

echo "Downloading Files..."

wget -q -P Temp/ $OPENCORE/OpenCore-Series-6.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-7.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-8.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-9.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-100.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-200.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-300.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-400.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-500.zip
wget -q -P Temp/ $OPENCORE/OpenCore-Series-600.zip

wget -q -P Scripts/Linux/ $SCRIPTS/Linux/download.sh

wget -q -P Scripts/Mac/ $SCRIPTS/Mac/backup
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/backup-efi
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/copy-efi
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/disable-gatekeeper
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/mount-efi
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/reset-dock
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/restore
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/restore-efi
wget -q -P Scripts/Mac/ $SCRIPTS/Mac/trim-enable

echo "Unpacking Files..."

unzip -o -qq Temp/OpenCore-Series-6.zip -d OpenCore/Series-6/
unzip -o -qq Temp/OpenCore-Series-7.zip -d OpenCore/Series-7/
unzip -o -qq Temp/OpenCore-Series-8.zip -d OpenCore/Series-8/
unzip -o -qq Temp/OpenCore-Series-9.zip -d OpenCore/Series-9/
unzip -o -qq Temp/OpenCore-Series-100.zip -d OpenCore/Series-100/
unzip -o -qq Temp/OpenCore-Series-200.zip -d OpenCore/Series-200/
unzip -o -qq Temp/OpenCore-Series-300.zip -d OpenCore/Series-300/
unzip -o -qq Temp/OpenCore-Series-400.zip -d OpenCore/Series-400/
unzip -o -qq Temp/OpenCore-Series-500.zip -d OpenCore/Series-500/
unzip -o -qq Temp/OpenCore-Series-600.zip -d OpenCore/Series-600/

chmod -R +x Scripts/*
rm -rf Temp

echo "Done"

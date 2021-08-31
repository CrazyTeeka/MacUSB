#!/bin/bash

CLOVER="https://github.com/CrazyTeeka/MacUSB/raw/master/Clover"
OPENCORE="https://github.com/CrazyTeeka/MacUSB/raw/master/OpenCore"
OLARILA="https://www.olarila.com/files"

mkdir -p $HOME/MacUSB/Download
rm -rf $HOME/MacUSB/Download/*
rm $HOME/MacUSB/checksums.txt

mkdir -p $HOME/MacUSB/Download/Old

wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-5.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-6.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-7.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-8.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-9.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-10.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-20.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-30.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-40.zip
wget -q -P $HOME/MacUSB/Download/Old/ $CLOVER/Clover-Series-50.zip

wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-6.zip
wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-7.zip
wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-8.zip
wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-9.zip
wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-10.zip
wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-20.zip
wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-30.zip
wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-40.zip
wget -q -P $HOME/MacUSB/Download/Old/ $OPENCORE/OpenCore-Series-50.zip

wget -q -P $HOME/MacUSB/Download/ $OLARILA/Folders/CLOVER.SERIES.CHIPSET.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/Folders/EFI%20Clover%20Serie%20100.200.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/Folders/EFI%20Clover%20Serie%20300.400.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/Folders/EFI%20Clover%20Serie%20500.zip

mv "$HOME/MacUSB/Download/CLOVER.SERIES.CHIPSET.zip"    $HOME/MacUSB/Download/Clover-Series-5.zip
mv "$HOME/MacUSB/Download/EFI Clover Serie 100.200.zip" $HOME/MacUSB/Download/Clover-Series-10.zip
mv "$HOME/MacUSB/Download/EFI Clover Serie 300.400.zip" $HOME/MacUSB/Download/Clover-Series-30.zip
mv "$HOME/MacUSB/Download/EFI Clover Serie 500.zip"     $HOME/MacUSB/Download/Clover-Series-50.zip

cp $HOME/MacUSB/Download/Clover-Series-5.zip  $HOME/MacUSB/Download/Clover-Series-6.zip
cp $HOME/MacUSB/Download/Clover-Series-5.zip  $HOME/MacUSB/Download/Clover-Series-7.zip
cp $HOME/MacUSB/Download/Clover-Series-5.zip  $HOME/MacUSB/Download/Clover-Series-8.zip
cp $HOME/MacUSB/Download/Clover-Series-5.zip  $HOME/MacUSB/Download/Clover-Series-9.zip
cp $HOME/MacUSB/Download/Clover-Series-10.zip $HOME/MacUSB/Download/Clover-Series-20.zip
cp $HOME/MacUSB/Download/Clover-Series-30.zip $HOME/MacUSB/Download/Clover-Series-40.zip

wget -q -P $HOME/MacUSB/Download/ $OLARILA/OpenCore%20Folders/EFI.OpenCore.Desktop.SandyBridge.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OpenCore%20Folders/EFI.OpenCore.Desktop.IvyBridge.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OpenCore%20Folders/EFI.Opencore.Desktop.Haswell.Broadwell.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OpenCore%20Folders/EFI.Opencore.Desktop.SkyLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OpenCore%20Folders/EFI.Opencore.Desktop.KabyLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OpenCore%20Folders/EFI.Opencore.Desktop.CoffeeLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OpenCore%20Folders/EFI.Opencore.Desktop.CometLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OpenCore%20Folders/EFI.Opencore.Desktop.RocketLake.zip

mv $HOME/MacUSB/Download/EFI.OpenCore.Desktop.SandyBridge.zip       $HOME/MacUSB/Download/OpenCore-Series-6.zip
mv $HOME/MacUSB/Download/EFI.OpenCore.Desktop.IvyBridge.zip         $HOME/MacUSB/Download/OpenCore-Series-7.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.Haswell.Broadwell.zip $HOME/MacUSB/Download/OpenCore-Series-8.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.SkyLake.zip           $HOME/MacUSB/Download/OpenCore-Series-10.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.KabyLake.zip          $HOME/MacUSB/Download/OpenCore-Series-20.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.CoffeeLake.zip        $HOME/MacUSB/Download/OpenCore-Series-30.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.CometLake.zip         $HOME/MacUSB/Download/OpenCore-Series-40.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.RocketLake.zip        $HOME/MacUSB/Download/OpenCore-Series-50.zip

cp $HOME/MacUSB/Download/OpenCore-Series-8.zip $HOME/MacUSB/Download/OpenCore-Series-9.zip

md5sum "$HOME/MacUSB/Download/Old/Clover-Series-5.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Old/Clover-Series-6.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Old/Clover-Series-7.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Old/Clover-Series-8.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Old/Clover-Series-9.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-5.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-6.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-7.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-8.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-9.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/Clover-Series-10.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Old/Clover-Series-20.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-10.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-20.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/Clover-Series-30.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Old/Clover-Series-40.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-30.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-40.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/Clover-Series-50.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Clover-Series-50.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-6.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-6.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-7.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-7.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-8.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-9.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-8.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-9.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-10.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-10.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-20.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-20.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-30.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-30.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-40.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-40.zip" >> $HOME/MacUSB/checksums.txt

echo "" >> $HOME/MacUSB/checksums.txt

md5sum "$HOME/MacUSB/Download/Old/OpenCore-Series-50.zip" >> $HOME/MacUSB/checksums.txt
md5sum "$HOME/MacUSB/Download/OpenCore-Series-50.zip" >> $HOME/MacUSB/checksums.txt

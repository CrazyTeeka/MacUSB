#!/bin/bash

OLARILA="https://www.olarila.com/files"

mkdir -p $HOME/MacUSB/Download
rm   -rf $HOME/MacUSB/Download/*

wget -q -P $HOME/MacUSB/Download/ $OLARILA/CLOVER1/CLOVER.SERIES.CHIPSET.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/CLOVER1/EFI%20Clover%20Serie%20100.200.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/CLOVER1/EFI%20Clover%20Serie%20300.400.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/CLOVER1/EFI%20Clover%20Serie%20500.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/CLOVER1/EFI%20Clover%20Serie%20600.zip

mv "$HOME/MacUSB/Download/CLOVER.SERIES.CHIPSET.zip"    $HOME/MacUSB/Download/Clover-Series-5.zip
mv "$HOME/MacUSB/Download/EFI Clover Serie 100.200.zip" $HOME/MacUSB/Download/Clover-Series-100.zip
mv "$HOME/MacUSB/Download/EFI Clover Serie 300.400.zip" $HOME/MacUSB/Download/Clover-Series-300.zip
mv "$HOME/MacUSB/Download/EFI Clover Serie 500.zip"     $HOME/MacUSB/Download/Clover-Series-500.zip
mv "$HOME/MacUSB/Download/EFI Clover Serie 600.zip"     $HOME/MacUSB/Download/Clover-Series-600.zip

cp $HOME/MacUSB/Download/Clover-Series-5.zip  $HOME/MacUSB/Download/Clover-Series-6.zip
cp $HOME/MacUSB/Download/Clover-Series-5.zip  $HOME/MacUSB/Download/Clover-Series-7.zip
cp $HOME/MacUSB/Download/Clover-Series-5.zip  $HOME/MacUSB/Download/Clover-Series-8.zip
cp $HOME/MacUSB/Download/Clover-Series-5.zip  $HOME/MacUSB/Download/Clover-Series-9.zip

cp $HOME/MacUSB/Download/Clover-Series-100.zip $HOME/MacUSB/Download/Clover-Series-200.zip
cp $HOME/MacUSB/Download/Clover-Series-300.zip $HOME/MacUSB/Download/Clover-Series-400.zip

wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.OpenCore.Desktop.SandyBridge.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.OpenCore.Desktop.IvyBridge.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.Opencore.Desktop.Haswell.Broadwell.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.Opencore.Desktop.SkyLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.Opencore.Desktop.KabyLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.Opencore.Desktop.CoffeeLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.Opencore.Desktop.CometLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.Opencore.Desktop.RocketLake.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE1/EFI.Opencore.Desktop.AlderLake.zip

mv $HOME/MacUSB/Download/EFI.OpenCore.Desktop.SandyBridge.zip       $HOME/MacUSB/Download/OpenCore-Series-6.zip
mv $HOME/MacUSB/Download/EFI.OpenCore.Desktop.IvyBridge.zip         $HOME/MacUSB/Download/OpenCore-Series-7.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.Haswell.Broadwell.zip $HOME/MacUSB/Download/OpenCore-Series-8.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.SkyLake.zip           $HOME/MacUSB/Download/OpenCore-Series-100.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.KabyLake.zip          $HOME/MacUSB/Download/OpenCore-Series-200.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.CoffeeLake.zip        $HOME/MacUSB/Download/OpenCore-Series-300.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.CometLake.zip         $HOME/MacUSB/Download/OpenCore-Series-400.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.RocketLake.zip        $HOME/MacUSB/Download/OpenCore-Series-500.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.AlderLake.zip         $HOME/MacUSB/Download/OpenCore-Series-600.zip
cp $HOME/MacUSB/Download/OpenCore-Series-8.zip                      $HOME/MacUSB/Download/OpenCore-Series-9.zip

#!/bin/bash

OLARILA="https://www.olarila.com/files"

mkdir -p $HOME/MacUSB/Download
rm   -rf $HOME/MacUSB/Download/*

wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.OpenCore.Desktop.SandyBridge.MOD.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.OpenCore.Desktop.IvyBridge.MOD.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.Opencore.Desktop.Haswell.Broadwell.MOD.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.Opencore.Desktop.SkyLake.MOD.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.Opencore.Desktop.KabyLake.MOD.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.Opencore.Desktop.CoffeeLake.MOD.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.Opencore.Desktop.CometLake.MOD.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.Opencore.Desktop.RocketLake.MOD.zip
wget -q -P $HOME/MacUSB/Download/ $OLARILA/OPENCORE.MOD1/EFI.Opencore.Desktop.AlderLake.MOD.zip

mv $HOME/MacUSB/Download/EFI.OpenCore.Desktop.SandyBridge.MOD.zip       $HOME/MacUSB/Download/OpenCore-Series-6.zip
mv $HOME/MacUSB/Download/EFI.OpenCore.Desktop.IvyBridge.MOD.zip         $HOME/MacUSB/Download/OpenCore-Series-7.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.Haswell.Broadwell.MOD.zip $HOME/MacUSB/Download/OpenCore-Series-8.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.SkyLake.MOD.zip           $HOME/MacUSB/Download/OpenCore-Series-100.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.KabyLake.MOD.zip          $HOME/MacUSB/Download/OpenCore-Series-200.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.CoffeeLake.MOD.zip        $HOME/MacUSB/Download/OpenCore-Series-300.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.CometLake.MOD.zip         $HOME/MacUSB/Download/OpenCore-Series-400.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.RocketLake.MOD.zip        $HOME/MacUSB/Download/OpenCore-Series-500.zip
mv $HOME/MacUSB/Download/EFI.Opencore.Desktop.AlderLake.MOD.zip         $HOME/MacUSB/Download/OpenCore-Series-600.zip
cp $HOME/MacUSB/Download/OpenCore-Series-8.zip                          $HOME/MacUSB/Download/OpenCore-Series-9.zip

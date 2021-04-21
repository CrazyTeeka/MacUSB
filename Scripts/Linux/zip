#!/bin/bash

sh update-kexts.sh
sh update-opencore.sh

rm -rf $HOME/MacUSB/Uploads/*

cd $HOME/MacUSB/OpenCore/Series-9
zip -r $HOME/MacUSB/Uploads/OpenCore-Series-9.zip EFI

cd $HOME/MacUSB/OpenCore/Series-200
zip -r $HOME/MacUSB/Uploads/OpenCore-Series-200.zip EFI

cd $HOME/MacUSB

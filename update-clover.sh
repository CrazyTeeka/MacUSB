#!/bin/bash

cp -rf Clover/Update/EFI Clover/Series-9/
cp -rf Clover/Update/EFI Clover/Series-100/
cp -rf Clover/Update/EFI Clover/Series-200/
cp -rf Clover/Update/EFI Clover/Series-300/
cp -rf Clover/Update/EFI Clover/Series-400/

if [ -d "Custom/James" ]; then
  cp -rf Clover/Update/EFI Custom/James/
fi

#!/bin/bash

USER1=""
USER2=""

rm -f  Clover.User/$USER1/EFI/BOOT/.empty
rm -rf Clover.User/$USER1/EFI/CLOVER/themes/*
cp -f  Clover.Config/DSDT/$USER1.aml   Clover.User/$USER1/EFI/CLOVER/ACPI/patched/DSDT.aml
cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.User/$USER1/EFI/BOOT/BOOTX64.efi
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.User/$USER1/EFI/CLOVER/CLOVERX64.efi

rm -f  Clover.User/$USER2/EFI/BOOT/.empty
rm -rf Clover.User/$USER2/EFI/CLOVER/themes/*
cp -f  Clover.Config/DSDT/$USER2.aml   Clover.User/$USER2/EFI/CLOVER/ACPI/patched/DSDT.aml
cp -f  Clover/EFI/BOOT/BOOTX64.efi     Clover.User/$USER2/EFI/BOOT/BOOTX64.efi
cp -f  Clover/EFI/CLOVER/CLOVERX64.efi Clover.User/$USER2/EFI/CLOVER/CLOVERX64.efi

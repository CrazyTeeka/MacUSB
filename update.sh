#!/bin/bash

clover="5116"

user1="James"
user2="Frank"

James () {
    rm -f  Clover.User/$user1/EFI/BOOT/.empty
    rm -rf Clover.User/$user1/EFI/CLOVER/themes/*
    cp -rf Clover.Config/Themes/Clovy              Clover.User/$user1/EFI/CLOVER/themes/
    cp -f  Clover.Config/DSDT/$user1.aml           Clover.User/$user1/EFI/CLOVER/ACPI/patched/DSDT.aml
    cp -f  Clover/$clover/EFI/BOOT/BOOTX64.efi     Clover.User/$user1/EFI/BOOT/BOOTX64.efi
    cp -f  Clover/$clover/EFI/CLOVER/CLOVERX64.efi Clover.User/$user1/EFI/CLOVER/CLOVERX64.efi
}

Frank () {
    rm -f  Clover.User/$user2/EFI/BOOT/.empty
    rm -rf Clover.User/$user2/EFI/CLOVER/themes/*
    cp -rf Clover.Config/Themes/Clovy              Clover.User/$user2/EFI/CLOVER/themes/
    cp -f  Clover.Config/DSDT/$user2.aml           Clover.User/$user2/EFI/CLOVER/ACPI/patched/DSDT.aml
    cp -f  Clover/$clover/EFI/BOOT/BOOTX64.efi     Clover.User/$user2/EFI/BOOT/BOOTX64.efi
    cp -f  Clover/$clover/EFI/CLOVER/CLOVERX64.efi Clover.User/$user2/EFI/CLOVER/CLOVERX64.efi
}

James
Frank

#!/bin/bash

clear

if ! [[ $(whoami) == "root" ]]
then
    printf "The script requires access to the root account!\n"
    exit
fi

printf "=====================================================\n"
printf "Flash-All (Linux) for T8100\n"
printf "Made for @SamuEDL & port to bash for @GabryProject\n"
printf "Thanks to Telegram Group \"Desarrollo Lamentablet OCU\"\n"
printf "======================================================\n"
printf "By default, the bootloader is locked.\n"
printf "Are you on a Bootloader Unlocked T8100?\n"
printf "\n"
printf "(1) Yes\n"
printf "(2) No\n"
printf "\n"
read -p "Select Option(Number): " option

if [[ $option == 1 ]]
then
    printf "Flashing Bootloader partitions..."
    fastboot "flash bootloader $PWD/bootloader.img"

    printf "Flashing Boot/DTBO/ENV partitions..."
    fastboot "flash boot $PWD/boot.img"
    fastboot "flash dtbo $PWD/dtbo.img"
    fastboot "flash env $PWD/env.img"

    printf "Flashing System partition... (this may take a while)"
    fastboot "flash super $PWD/super.img"

    printf "Flashing recovery partition..."
    fastboot "flash recovery $PWD/recovery.img"

    printf "Flashing vbmeta partitions..."
    fastboot "--disable-verity flash vbmeta $PWD/vbmeta.img"
    fastboot "--disable-verity flash vbmeta_system $PWD/vbmeta_system.img"
    fastboot "--disable-verity flash vbmeta_vendor $PWD/vbmeta_vendor.img"

    printf "Wipping data.."
    fastboot "erase userdata"
    fastboot "-w"
    fastboot "reboot"

    printf "Flash Complete. Reboting..."
    exit

fi

if [[ $option == 2 ]]
then
    clear
    printf "To flash the rom, the bootloader has to be unlocked.\n"
    exit
fi

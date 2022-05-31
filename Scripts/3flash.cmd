@echo off
COLOR 0C
:Opciones
CLS
echo =====================================================
echo Flash-All for T8100.
echo Made for @SamuEDL
echo ======================================================
echo By default, the bootloader is locked.
echo Are you on a Bootloader Unlocked T8100?
echo.
echo (1) Yes
echo (2) No
echo.
set /P opcion=Select Option: 
if %opcion% == 1 goto flash
if %opcion% == 2 goto noflash

goto Opciones

:flash

echo "Flashing Bootloader partitions..."
fastboot flash bootloader bootloader.img

echo "Flashing Boot/DTBO/ENV partitions..."
fastboot flash boot boot.img
fastboot flash dtbo dtbo.img
echo "Flashing System partition... (this may take a while)"
fastboot flash super super.img

echo "Flashing recovery partition..."
fastboot flash recovery.img

echo "Flashing vbmeta partitions..."
fastboot --disable-verity flash vbmeta vbmeta.img
fastboot --disable-verity flash vbmeta_system vbmeta_system.img
fastboot --disable-verity flash vbmeta_vendor vbmeta_vendor.img

echo "Wipping data.."
fastboot erase userdata
fastboot -w
fastboot reboot bootloader

echo "Flash Complete. Reboting..."

:noflash
CLS
echo To flash the rom, the bootloader has to be unlocked.
pause
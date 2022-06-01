@echo off
COLOR 0C
:inicio
CLS
echo =====================================================
echo Dump (Windows) for T8100
echo Based on AllwinnerDumpTool
echo Adapted for T8100 by @SamuEDL
echo Thank for telegram group "Desarrollo Lamentablet OCU"
echo ======================================================
echo This tool makes a backup of the tablet's firmware using ADB.
echo This script requires the tablet to have 3.5GB free on internal memory.
echo.
echo Do you want to continue?
echo.
echo (1) Si
echo (2) No
echo.
set /P opcion=Selecciona una opcion(Numero): 
if %opcion% == 1 goto dump
if %opcion% == 2 goto nodump
goto inicio

:dump
CLS
echo -----Creating the dump folder in memory---
adb shell mkdir /sdcard/dump
echo.
echo -----Copying the ROM into memory----------
echo Copying super...
adb shell su -c "dd if=/dev/block/nand0p4 of=/sdcard/dump/super.img"
echo Copying boot...
adb shell su -c "dd if=/dev/block/nand0p3 of=/sdcard/dump/boot.img"
echo Copying bootloader...
adb shell su -c "dd if=/dev/block/nand0p1 of=/sdcard/dump/bootloader.img"
echo Copying recovery...
adb shell su -c "dd if=/dev/block/nand0p6 of=/sdcard/dump/recovery.img"
echo Copying vbmetas...
adb shell su -c "dd if=/dev/block/nand0p8 of=/sdcard/dump/vbmeta.img"
adb shell su -c "dd if=/dev/block/nand0p9 of=/sdcard/dump/vbmeta_system.img"
adb shell su -c "dd if=/dev/block/nand0p10 of=/sdcard/dump/vbmeta_vendor.img"
echo Copying env/dtbo...
adb shell su -c "dd if=/dev/block/nand0p2 of=/sdcard/dump/env.img"
adb shell su -c "dd if=/dev/block/nand0p15 of=/sdcard/dump/dtbo.img"
echo.
echo.
CLS
echo Copying finished
echo You can find the backup in the dump directory of the internal memory.
pause
exit

:nodump
exit



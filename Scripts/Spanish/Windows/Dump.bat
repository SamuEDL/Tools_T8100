@echo off
COLOR 0C
:inicio
CLS
echo =====================================================
echo Dump (Windows) para T8100
echo Basado en AllwinnerDumpTool
echo Adaptado para la T8100 por @SamuEDL
echo Agradecimientos al grupo de Telegram "Desarrollo Lamentablet OCU"
echo ======================================================
echo Esta herramienta realiza un backup del firmware de la tablet usando ADB.
echo Este script requiere que la tablet tenga 3,5GB libres en la memoria interna,
echo para realizar el backup.
echo.
echo Deseas continuar?
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
echo -----Creando la carpeta dump en la memoria---
adb shell mkdir /sdcard/dump
echo.
echo -----Copiando la ROM en la memoria----------
echo Copiando super...
adb shell su -c "dd if=/dev/block/nand0p4 of=/sdcard/dump/super.img"
echo Copiando boot...
adb shell su -c "dd if=/dev/block/nand0p3 of=/sdcard/dump/boot.img"
echo Copiando bootloader...
adb shell su -c "dd if=/dev/block/nand0p1 of=/sdcard/dump/bootloader.img"
echo Copiando recovery...
adb shell su -c "dd if=/dev/block/nand0p6 of=/sdcard/dump/recovery.img"
echo Copiando vbmetas...
adb shell su -c "dd if=/dev/block/nand0p8 of=/sdcard/dump/vbmeta.img"
adb shell su -c "dd if=/dev/block/nand0p9 of=/sdcard/dump/vbmeta_system.img"
adb shell su -c "dd if=/dev/block/nand0p10 of=/sdcard/dump/vbmeta_vendor.img"
echo Copiando env/dtbo...
adb shell su -c "dd if=/dev/block/nand0p2 of=/sdcard/dump/env.img"
adb shell su -c "dd if=/dev/block/nand0p15 of=/sdcard/dump/dtbo.img"
echo.
echo.
CLS
echo Copia terminada
echo Puedes encontrar el backup en el directorio dump de la memoria interna.
pause
exit

:nodump
exit



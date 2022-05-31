@echo off
echo /////Ocu T8100 Dump///
echo Basado en Allwinner Dump Tool
echo Adaptado a la Ocu T8100 Dump por SamuEDL
echo.
echo Esta herramienta vuelca el firmware de la tablet en tu PC usando ADB. 
echo Si no estas familiarizado con el uso de ADB busca en la web y informate.
echo Este script requiere tener montada una tarjeta SD en el dispositivo con
echo al menos 3,5GB de espacio libre disponible y ser root.
echo.
pause

:fw_dump
echo -----Creando la carpeta dump en la SD card---
echo adb.exe shell mkdir /sdcard/dump
echo.
echo -----Copiando la ROM en la SD card----------
echo Copiando bootloader...
echo adb.exe shell su -c "dd if=/dev/block/nand0p3 of=destino"
echo.
echo.
echo Copia terminada
echo.
echo Puedes encontrar el firm en la SD
pause


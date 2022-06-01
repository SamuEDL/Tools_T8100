@echo off
COLOR 0C
:Opciones
CLS
echo =====================================================
echo Flash-All (Windows) for T8100
echo Realizado por @SamuEDL
echo Gracias al grupo de Telegram "Desarrollo Lamentablet OCU"
echo ======================================================
echo Por defecto, el bootloader esta cerrado.
echo Tienes el bootloader desbloqueado de la T8100?
echo.
echo (1) Si
echo (2) No
echo.
set /P opcion=Selecciona una opcion(Numero): 
if %opcion% == 1 goto flash
if %opcion% == 2 goto noflash

goto Opciones

:flash

echo "Instalando Bootloader partitions..."
fastboot flash bootloader bootloader.img

echo "Instalando Boot/DTBO/ENV partitions..."
fastboot flash boot boot.img
fastboot flash dtbo dtbo.img
fastboot flash env env.img

echo "Instalando System partition... (Tomara un tiempo)"
fastboot flash super super.img

echo "Instalando recovery partition..."
fastboot flash recovery.img

echo "Instalando vbmeta partitions..."
fastboot --disable-verity flash vbmeta vbmeta.img
fastboot --disable-verity flash vbmeta_system vbmeta_system.img
fastboot --disable-verity flash vbmeta_vendor vbmeta_vendor.img

echo "Eliminando datos.."
fastboot erase userdata
fastboot -w
fastboot reboot

echo "Instalacion completada. Reiniciando..."
pause
exit

:noflash
CLS
echo Para instalar la rom, el bootloader debe estar desbloqueado
pause
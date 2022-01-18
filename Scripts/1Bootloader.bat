@echo off
COLOR 0C
:Opciones
CLS
echo =====================================================
echo Script para desbloquear el bootloader de la OCU T8100.
echo Realizado por @SamuEDL
echo ======================================================
echo Elige una opcion
echo.
echo (1) Comprobar Bootloader
echo (2) Desbloquear Boootloader
echo (3) Bloquear Boootloader
echo.
set /P opcion=Selecciona una opcion: 
if %opcion% == 1 goto Comprobacion
if %opcion% == 2 goto Desbloqueo
if %opcion% == 3 goto Bloqueo
goto Opciones
:volver 
CLS
echo Quieres volver al menu principal?
echo.
echo (1) Si
echo (2) No
echo.
set /p VolverVar=Selecciona una opcion: 
if %VolverVar%==1 goto opciones
if %VolverVar%==2 goto salir
goto volver
:salir
exit
:Comprobacion
CLS
echo ---------Comprobacion Bootloader---------
echo Comprobando bootloader
echo El proceso ha terminado
pause
goto volver
:Desbloqueo
echo ---------Desbloqueo Bootloader---------
echo Desbloqueado bootloader
echo El proceso ha terminado, se procede a reiniciar la tablet
pause
goto volver
:Bloqueo
echo ---------Bloqueo Bootloader---------
echo Bloqueado bootloader
echo El proceso ha terminado, se procede a reiniciar la tablet
pause
goto volver

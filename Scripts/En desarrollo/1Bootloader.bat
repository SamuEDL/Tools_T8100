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
if %VolverVar% == 1 goto opciones
if %VolverVar% == 2 goto salir
goto volver
:Comprobacion
CLS
echo ---------Comprobacion Bootloader---------
echo Antes que nada, debes entrar en el bootloader.
echo Para ello con la tablet apagada, presiona el boton vol - y el boton power. Y espera que salga un android
pause
goto volver
:Desbloqueo
CLS
echo ---------Desbloqueo Bootloader---------
echo ------------ADVERTENCIA !!!!! -----------
echo Este proceso formatea la tablet, por lo que se recomienda que previamente se haya realizado un backup.
pause
CLS
echo.
echo --------- 1 - Paso --------------------
echo.
echo Con la tablet en android, vete a Ajustes - Sistema - Acerca de tablet
echo Presiona varias veces a numero de compilacion hasta que aparezca `Ahora eres un desarrollador`.
echo Vete a Ajustes - Sistema - Opciones para desarrolladores y activa `Desbloqueo OEM`
echo.
pause
CLS
echo ---------2 - Paso -------------------
echo ------Entrar en el fastboot----------
echo.
echo Para ello con la tablet apagada, presiona el boton vol - y el boton power. Y espera que salga un android.
echo.
pause
cls
echo Desbloqueando bootloader...
echo Desbloqueo finalizado reiniciando. Ya puedes desconectar la tablet del PC.
pause
goto volver
:Bloqueo
CLS
echo ---------Bloqueo Bootloader---------
echo.
echo ---------1 - Paso -------------------
echo ------Entra en el fastboot----------
echo Para ello con la tablet apagada, presiona el boton vol - y el boton power. Y espera que salga un android.
echo.
CLS
echo Bloqueando bootloader...
echo Bloqueo finalizado reiniciando. Ya puedes desconectar la tablet del PC.
pause
goto volver
:salir
exit
@ECHO OFF
cd System
mkdir Temp
mpkgx MegaPackage.dat Temp
del Temp\System\Engine.u
del Temp\System\Editor.u
del Temp\System\dnWindow.u
del Temp\System\dnGame.u
xcopy Temp\* ..\ /s /y
rmdir Temp /s /q
cd shaders
del *.dat*
cd ..
cd ..
cls

:start
SET choice=
SET /p choice=Do you want to install the Vulkan wrapper? [Y] [N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO "%choice%" is not valid
ECHO.
GOTO start

:no
cls
ECHO DNF: Enhanced was successfully installed
PAUSE
EXIT

:yes
xcopy DXVK\* System /y
cls
ECHO DNF: Enhanced was successfully installed
PAUSE
EXIT
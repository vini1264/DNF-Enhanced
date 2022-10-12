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

:vulkanstart
SET choice=
SET /p choice=Do you want to install the Vulkan wrapper? [Y] [N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO vulkanyes
IF '%choice%'=='y' GOTO vulkanyes
IF '%choice%'=='N' GOTO vulkanno
IF '%choice%'=='n' GOTO vulkanno
IF '%choice%'=='' GOTO vulkanno
ECHO "%choice%" is not valid
ECHO.
GOTO vulkanstart

:vulkanno
cls
GOTO hudstart

:vulkanyes
xcopy DXVK\* System /y
cls
GOTO hudstart

:hudstart
SET choice=
SET /p choice=Do you want to install the alternative HUD? [Y] [N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO hudyes
IF '%choice%'=='y' GOTO hudyes
IF '%choice%'=='N' GOTO hudno
IF '%choice%'=='n' GOTO hudno
IF '%choice%'=='' GOTO hudno
ECHO "%choice%" is not valid
ECHO.
GOTO hudstart

:hudno
xcopy OldHUD\* System /y
cls
ECHO DNF: Enhanced was successfully installed
PAUSE
EXIT

:hudyes
xcopy AltHUD\* System /y
cls
ECHO DNF: Enhanced was successfully installed
PAUSE
EXIT
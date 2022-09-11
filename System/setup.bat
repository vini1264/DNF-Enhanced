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

@echo off
title Press any key to confirm
pause
title Work...
taskkill /f /im explorer.exe
reg export "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" %temp%\_ResetFolders.reg /y
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell" /f
start /w %windir%\regedit.exe /S %temp%\_ResetFolders.reg
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\UFH\SHC" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\UFH\SHC"
start explorer.exe

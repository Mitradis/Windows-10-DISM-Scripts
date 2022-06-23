mode con:cols=50 lines=1
title Start work...
call :PostClear>>%userprofile%\Desktop\PostClear.log 2>&1
EXIT /b 0
:PostClear
if exist %programdata%\PostClear\FirstLoad.txt (
	title Kill Explorer
	taskkill /f /im explorer.exe
	TIMEOUT /T 5 /NOBREAK >nul
	del /f /q %programdata%\PostClear\FirstLoad.txt
	goto Reboot
)
if exist %programdata%\PostClear\PostClearM.bat (
	call %programdata%\PostClear\PostClearM.bat
	del /f /q %programdata%\PostClear\PostClearM.bat
) else (
	taskkill /f /im explorer.exe
	TIMEOUT /T 1 /NOBREAK >nul
)
title Applying PostClear.reg
start /w %windir%\regedit.exe /S %programdata%\PostClear\PostClear.reg
if exist %windir%\en-US\explorer.exe.mui (
	reg add "HKEY_CURRENT_USER\SOFTWARE\IvoSoft\ClassicShell\Settings" /v Language /t REG_SZ /d "en-US"
)
if exist %windir%\zh-CN\explorer.exe.mui (
	reg add "HKEY_CURRENT_USER\SOFTWARE\IvoSoft\ClassicShell\Settings" /v Language /t REG_SZ /d "zh-CN"
)
:Reboot
title Start Explorer
start %windir%\explorer.exe
TIMEOUT /T 2 /NOBREAK >nul
title Rebooting...
SHUTDOWN -r -t 3

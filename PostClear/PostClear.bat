mode con:cols=50 lines=1
title Start work...
call :PostClear>>%userprofile%\Desktop\PostClear.log 2>&1
EXIT /b 0
:PostClear
title Wait Explorer
taskkill /f /im explorer.exe
if exist %programdata%\PostClear\FirstLoad.txt (
	TIMEOUT /T 5 /NOBREAK >nul
	reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\EventLog" /v Start /t REG_DWORD /d 4 /f
	del /f /q %programdata%\PostClear\FirstLoad.txt
	goto Reboot
)
if exist %programdata%\PostClear\PostClearM.bat (
	call %programdata%\PostClear\PostClearM.bat
	del /f /q %programdata%\PostClear\PostClearM.bat
) else (
	for /F "skip=1 tokens=2*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\InstallService" /V Start') do (if %%B equ 0x4 (title Press any key && start cmd /c "mode con:cols=60 lines=3 && title AppX Warning && echo off && echo "Microsoft Store Install Service" is Disabled! && echo Before create new account you must Enable AppX support. && pause" && pause))
	TIMEOUT /T 1 /NOBREAK >nul
)
title Applying PostClear.reg
start /w %windir%\regedit.exe /S %programdata%\PostClear\PostClear.reg
TIMEOUT /T 1 /NOBREAK >nul
if exist %windir%\en-US\explorer.exe.mui (
	reg add "HKEY_CURRENT_USER\SOFTWARE\IvoSoft\ClassicShell\Settings" /v Language /t REG_SZ /d "en-US"
)
if exist %windir%\zh-CN\explorer.exe.mui (
	reg add "HKEY_CURRENT_USER\SOFTWARE\IvoSoft\ClassicShell\Settings" /v Language /t REG_SZ /d "zh-CN"
)
TIMEOUT /T 1 /NOBREAK >nul
:Reboot
title Start Explorer
start %windir%\explorer.exe
TIMEOUT /T 2 /NOBREAK >nul
title Rebooting...
SHUTDOWN -r -t 3

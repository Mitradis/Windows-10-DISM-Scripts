mode con:cols=50 lines=1
title Start work...

call :Clear>>Z:\Clear.log 2>&1
EXIT /b 0

:Clear
title Applying Clear.ps1
dism /get-imageinfo /imagefile:Z:\install.wim /index:10
if %ERRORLEVEL% EQU -1051328239 (
	del /f /q Z:\EN.txt
)
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -File Z:\Clear.ps1
title Applying Clear.reg
reg load HKEY_LOCAL_MACHINE\WIM_SOFTWARE Z:\Install\Windows\System32\config\SOFTWARE
reg load HKEY_LOCAL_MACHINE\WIM_SYSTEM Z:\Install\Windows\System32\config\SYSTEM
reg load HKEY_LOCAL_MACHINE\WIM_CURRENT_USER Z:\Install\Users\Default\NTUSER.DAT
TIMEOUT /T 1 /NOBREAK >nul
start /w %windir%\regedit.exe /S Z:\Clear.reg
TIMEOUT /T 1 /NOBREAK >nul
reg unload HKEY_LOCAL_MACHINE\WIM_CURRENT_USER
reg unload HKEY_LOCAL_MACHINE\WIM_SYSTEM
reg unload HKEY_LOCAL_MACHINE\WIM_SOFTWARE
title Hide NTUSER.DAT
ATTRIB Z:\Install\Users\Default\NTUSER.DAT +S +H
title Shortcuts
move "Z:\Install\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\System Tools\Character Map.lnk" "Z:\Install\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools"
set DEL="Z:\Install\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\desktop.ini"
type %DEL%>>%DEL%.temp
del /f /q /a:sh %DEL%
move %DEL%.temp %DEL%
echo Character Map.lnk=@%SystemRoot%\system32\shell32.dll,-22021>>%DEL%
ATTRIB %DEL% +S +H
rd /s /q "Z:\Install\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\System Tools"
move "Z:\Install\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell ISE.lnk" "Z:\Install\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools"
rd /s /q "Z:\Install\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows PowerShell"
rd /s /q "Z:\Install\ProgramData\Microsoft\Windows\Start Menu\Programs\Maintenance"
move "Z:\Install\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" "Z:\Install\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools"
rd /s /q "Z:\Install\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell"
del /f /q "Z:\Install\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\computer.lnk"
del /f /q "Z:\Install\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
rd /s /q "Z:\Install\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Maintenance"
title EdgeUpdate
rd /s /q "Z:\Install\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "Z:\Install\Program Files (x86)\Microsoft\Edge\Application\92.0.902.67\Installer"
del /f /q "Z:\Install\Program Files (x86)\Microsoft\Edge\Application\92.0.902.67\elevation_service.exe"
del /f /q "Z:\Install\Program Files (x86)\Microsoft\Edge\Application\92.0.902.67\notification_helper.exe"
del /f /q "Z:\Install\Program Files (x86)\Microsoft\Edge\Application\92.0.902.67\notification_helper.exe.manifest"
title OneDrive
set DEL=Z:\Install\Windows\SysWOW64\OneDriveSetup.exe
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\wow64_microsoft-windows-onedrive-setup_31bf3856ad364e35_10.0.19041.1_none_e585f901f9ce93e6
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
rd /s /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\Manifests\amd64_microsoft-windows-onedrive-setup_31bf3856ad364e35_10.0.19041.1_none_db314eafc56dd1eb.manifest
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\Manifests\wow64_microsoft-windows-onedrive-setup_31bf3856ad364e35_10.0.19041.1_none_e585f901f9ce93e6.manifest
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
title UPFC
set DEL=Z:\Install\Windows\System32\upfc.exe
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
move Z:\upfc.exe Z:\Install\Windows\System32
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path Z:\Install\Windows\System32\control.exe | Set-Acl -Path %DEL%"
set DEL=Z:\Install\Windows\WinSxS\amd64_microsoft-windows-upfc_31bf3856ad364e35_10.0.19041.1_none_5d169326bbc0abdb
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
rd /s /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\Manifests\amd64_microsoft-windows-upfc_31bf3856ad364e35_10.0.19041.1_none_5d169326bbc0abdb.manifest
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
title Calc
set DEL=Z:\Install\Windows\System32\calc.exe
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
move Z:\calc.exe Z:\Install\Windows\System32
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path Z:\Install\Windows\System32\control.exe | Set-Acl -Path %DEL%"
if exist Z:\Install\Windows\en-US\explorer.exe.mui (
	del /f /q Z:\EN.txt
	del /f /q Z:\calc.exe.cn.mui
	del /f /q Z:\calc.exe.ru.mui
	copy Z:\calc.exe.en.mui Z:\Install\Windows\System32\en-US\calc.exe.mui
	move Z:\calc.exe.en.mui Z:\Install\Windows\SysWOW64\en-US
)
if exist Z:\Install\Windows\zh-CN\explorer.exe.mui (
	del /f /q Z:\calc.exe.en.mui
	del /f /q Z:\calc.exe.ru.mui
	copy Z:\calc.exe.cn.mui Z:\Install\Windows\System32\zh-CN\calc.exe.mui
	move Z:\calc.exe.cn.mui Z:\Install\Windows\SysWOW64\zh-CN
)
if exist Z:\Install\Windows\ru-RU\explorer.exe.mui (
	del /f /q Z:\calc.exe.en.mui
	del /f /q Z:\calc.exe.cn.mui
	copy Z:\calc.exe.ru.mui Z:\Install\Windows\System32\ru-RU\calc.exe.mui
	move Z:\calc.exe.ru.mui Z:\Install\Windows\SysWOW64\ru-RU
)
set DEL=Z:\Install\Windows\WinSxS\amd64_microsoft-windows-calc_31bf3856ad364e35_10.0.19041.1_none_5faf0ebeba197e78
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
rd /s /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\Manifests\amd64_microsoft-windows-calc_31bf3856ad364e35_10.0.19041.1_none_5faf0ebeba197e78.manifest
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
set DEL=Z:\Install\Windows\SysWOW64\calc.exe
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
move Z:\calc_64.exe Z:\Install\Windows\SysWOW64\calc.exe
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path Z:\Install\Windows\System32\control.exe | Set-Acl -Path %DEL%"
set DEL=Z:\Install\Windows\WinSxS\wow64_microsoft-windows-calc_31bf3856ad364e35_10.0.19041.1_none_6a03b910ee7a4073
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
rd /s /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\Manifests\wow64_microsoft-windows-calc_31bf3856ad364e35_10.0.19041.1_none_6a03b910ee7a4073.manifest
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
title Edge Chromium
set DEL=Z:\Install\Windows\WinSxS\amd64_microsoft-windows-edgechromium_31bf3856ad364e35_10.0.19041.1266_none_74657031110a9d30
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
rd /s /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\Manifests\amd64_microsoft-windows-edgechromium_31bf3856ad364e35_10.0.19041.1266_none_74657031110a9d30.manifest
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
title GameDVR
set DEL="Z:\Install\Windows\bcastdvr\KnownGameList.bin"
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
move Z:\KnownGameList.bin %DEL%
%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path Z:\Install\Windows\System32\control.exe | Set-Acl -Path %DEL%"
title Copy PostClear
move Z:\PostClear Z:\Install\ProgramData\PostClear
title WaaS tasks
set DEL=Z:\Install\Windows\WaaS\services
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
rd /s /q %DEL%
set DEL=Z:\Install\Windows\WaaS\tasks
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
rd /s /q %DEL%
set DEL=Z:\Install\Windows\WaaS
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
rd /s /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\FileMaps\$$_waas_services_ddfc4ae175ff1678.cdf-ms
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
set DEL=Z:\Install\Windows\WinSxS\FileMaps\$$_waas_tasks_0504086c7768f632.cdf-ms
takeown /f %DEL%
icacls %DEL% /grant "%username%":f /c /l /q
del /f /q %DEL%
title Clear WinSxS
for /f "tokens=*" %%i in ('dir Z:\Install\Windows\WinSxS\Backup /b /a:-d') do (
	icacls "Z:\Install\Windows\WinSxS\Backup\%%~i" /grant "%username%":f /c /l /q
	del /f /q "Z:\Install\Windows\WinSxS\Backup\%%~i"
)
title Compress Winre
start /w Z:\WimOptimize.exe Z:\Install\Windows\System32\Recovery\Winre.wim
TIMEOUT /T 1 /NOBREAK >nul
title Unmounting
dism /unmount-wim /mountdir:Z:\Install /commit
title Compress Boot
start /w Z:\WimOptimize.exe Z:\boot.wim
title Done...
del /f /q Z:\Clear.ps1
del /f /q Z:\Clear.reg
del /f /q Z:\DISM.10.Scripts.zip
del /f /q Z:\WimOptimize.exe
del /f /q Z:\Clear.bat

taskkill /f /im vmtoolsd.exe
taskkill /f /im explorer.exe
taskkill /f /im sihost.exe
taskkill /f /im ShellExperienceHost.exe
taskkill /f /im backgroundTaskHost.exe
set REPLACE=DDORes.dll.mun imageres.dll.mun mmres.dll.mun shell32.dll.mun
for %%a in (%REPLACE%) do (
	if exist "%cd%\%%a" (
		takeown /f %windir%\SystemResources\%%a
		icacls %windir%\SystemResources\%%a /grant "%username%":f /c /l /q
		superUser64.exe /ws cmd /c "del /f /q %windir%\SystemResources\%%a"
		superUser64.exe /ws cmd /c "move "%cd%\%%a" %windir%\SystemResources"
	)
)
for %%a in (%REPLACE%) do (
	%windir%\System32\WindowsPowerShell\v1.0\Powershell.exe -executionpolicy remotesigned -Command "& Get-Acl -Path %windir%\System32\control.exe | Set-Acl -Path %windir%\SystemResources\%%a"
)
pause

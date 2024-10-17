dism /export-image /sourceimagefile:Z:\install.wim /sourceindex:1 /destinationimagefile:Z:\install.esd /compress:recovery

Информационные команды (Shell):
dism /get-imageinfo /imagefile:Z:\install.wim
mkdir Z:\Install
dism /mount-image /imagefile:Z:\install.wim /index:1 /mountdir:Z:\Install
dism /image:Z:\Install /get-provisionedappxpackages > Z:\list1.txt
dism /image:Z:\Install /get-capabilities > Z:\list2.txt
dism /image:Z:\Install /get-features > Z:\list3.txt

Подготовка бекапа групповых политик:
-произвести изменения в Win+R - gpedit.msc
-бекапы создаются и хранятся в C:\Windows\System32\GroupPolicy, можно создать вручную через команду:
C:\LGPO.exe /b C:\

Для отображения всех применяемых во время установки опций в утилите WinTool
и их номера-маски использовать ключ запуска WinTool.exe -setup=

# Windows-10-DISM-Scripts
Support languages\支持语言\Поддерживаемые языки: EN-US\ZH-CN\RU-RU

Image optimization by removing pre-installed junk packages, disabling update tasks, disabling Defender and other minor changes. All this is done by standard means (DISM commands, CMD queries and changing registry keys). The goal is to get in a natural way (without interfering with system files) the most standard, clean image with unnecessary elements disabled. Disabled in the most efficient, safest and easiest way, without making a bunch of thoughtless and unnecessary edits.

通過刪除預安裝的垃圾包、禁用更新任務、禁用 Defender 和其他細微更改來優化圖像。 所有這些都是通過標準方式（DISM 命令、CMD 查詢和更改註冊表項）完成的。 目標是以自然的方式（不干擾系統文件）獲得最標準、最乾淨的圖像，並禁用不必要的元素。 以最有效、最安全和最簡單的方式禁用，無需進行大量輕率和不必要的編輯。

Оптимизация образа путем удаления предустановленных пакетов программ-мусора, отключение задач обновления, отключение Защитника и другие мелкие изменения. Все это производится стандартными средствами (командами DISM, запросами CMD и изменением ключей реестра). Цель - получить естественным путем (без вмешательства в системные файлы) максимально стандартный, чистый образ с отключенными ненужными элементами. Отключенными самыми эффективными, безопасными и простыми способами, без внесения кучи бездумных и ненужных правок.

Все подробности тут: [vk.com/@slmp_mod-windows-10-dism-scripts
](https://vk.com/@slmp_mod-windows-10-dism-scripts)

# Using:
- Must have full administrator rights: Computer Configuration - Windows Settings - Security Settings - Local Policies - Security Options - User Account Control: All Administrators Run in Approval Mode - Disabled.
- To use scripts, you need an image, revision and checksums are specified in the description of script releases.
- The image must be mounted.
- You need any RAM disk with the letter Z (it's just the last letter of the alphabet), 11500MB in size with which DISM (SoftPerfect RAM Disk and analogues) can work.
- Unpack the scripts, install.wim and boot.wim files (from the source folder of the .iso file) to the root of the RAM disk.
- Run Clear.bat and wait for the window to close.
- Make sure there are no errors in the Clear.log file by searching: “operation”, “errors”, “not”.
- Run CMD and run the first command from the _readme.txt file.
- Using UltraISO (or analogues), delete the install.wim file in the .iso image and add the resulting install.esd and boot.wim.
- The image is ready.
- During the installation of this image, the Internet must be turned off until the system is automatically rebooted 2 times.

# 应用：
- 必须拥有完整的管理员权限：计算机配置 - Windows 设置 - 安全设置 - 本地策略 - 安全选项 - 用户帐户控制：所有管理员在批准模式下运行 - 已禁用。
- 要使用脚本，您需要在脚本版本的描述中指定图像、修订和校验和。
- 必须安装图像。
- 您需要任何带有字母 Z（它只是字母表的最后一个字母）的 RAM 磁盘，大小为 11500MB，DISM（SoftPerfect RAM 磁盘和类似物）可以使用。
- 将脚本、install.wim 和 boot.wim 文件（从 .iso 文件的源文件夹）解压到 RAM 磁盘的根目录。
- 运行 Clear.bat 并等待窗口关闭。
- 通过搜索“操作”、“错误”、“不”，确保 Clear.log 文件中没有错误。
- 运行 CMD 并运行 _readme.txt 文件中的第一个命令。
- 使用 UltraISO（或类似物），删除 .iso 映像中的 install.wim 文件并添加生成的 install.esd 和 boot.wim。
- 图像已准备就绪。
- 在安裝此映像期間，必須關閉 Internet，直到系統自動重新啟動 2 次。

# Применение:
- Должны быть полные права администратора: Конфигурация компьютера — Конфигурация Windows — Параметры безопасности — Локальные политики — Параметры безопасности — Контроль учетных записей: все администраторы работают в режиме одобрения — Отключено.
- Для применения скриптов понадобиться образ, редакция и контрольные суммы указаны в описании релизов скриптов.
- Образ должен быть смонтирован.
- Понадобиться любой RAM диск, с буквой Z (просто это последняя буква алфавита), размером 11500МБ с которым может работать DISM (SoftPerfect RAM Disk и аналоги).
- Распаковать скрипты, файлы install.wim и boot.wim (из папки source файла .iso) в корень RAM диска.
- Запустить Clear.bat и ожидать завершение работы окна.
- Убедится в отсутствии ошибок в файле Clear.log по поиску: «операция», «оши», «не ».
- Запустить CMD и выполнить первую команду из файла _readme.txt.
- С помощью UltraISO (или аналогов) удалить в .iso образе файл install.wim и добавить получившийся install.esd и boot.wim.
- Образ готов.
- Во время установки данного образа должен быть выключен интернет, пока система не будет автоматически 2 раза перезагружена.

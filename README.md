# Windows-10-DISM-Scripts / [Windows-11-DISM-Scripts](https://github.com/Mitradis/Windows-11-DISM-Scripts)
Поддерживаемые языки\Support languages\支持的语言: RU-RU\EN-US\ZH-CN

Цель проекта - с помощью стандартных средств (командами DISM, запросами CMD и изменением ключей реестра) создать пересобранный оптимизированный образ в автоматическом отказоустойчивом режиме, исключая человеческий фактор и сопутствующие ошибки при этой процедуре. Таким образом дать возможность каждому создать свою собственную сборку Windows, с гарантированным пониманием ее содержимого и произведенных изменений. Сам набор создавался и поддерживается на принципах минимального вмешательства с максимально эффективными точечными необходимыми изменениями, без вмешательства в системные файлы. Внести те изменения, которые улучшат работу ОС, снизят нагрузку на ПК и расход его ресурсов, сделают использование ОС более комфортным и приятным и при этом сохранят весь ее основной функционал.

The goal of the project is to use standard tools (DISM commands, CMD queries and changing registry keys) to create a rebuilt optimized image in an automatic fault-tolerant mode, eliminating the human factor and associated errors during this procedure. Thus, giving everyone the opportunity to create their own Windows build, with a guaranteed understanding of its contents and the changes made. The set itself was created and maintained on the principles of minimal intervention with the most effective targeted necessary changes, without interfering with system files. Make those changes that will improve the operation of the OS, reduce the load on the PC and the consumption of its resources, make using the OS more comfortable and enjoyable, and at the same time retain all its main functionality.

该项目的目标是使用标准工具（DISM 命令、CMD 查询和更改注册表项）以自动容错模式创建重建的优化映像，从而消除此过程中的人为因素和相关错误。 因此，每个人都有机会创建自己的 Windows 版本，并保证了解其内容和所做的更改。 该集本身的创建和维护遵循最少干预和最有效的有针对性的必要更改的原则，而不干扰系统文件。 进行这些更改将改善操作系统的操作，减少 PC 上的负载及其资源消耗，使操作系统的使用更加舒适和愉快，同时保留其所有主要功能。

# Применение:
- Понадобиться любой диск (если RAM, то нужна поддержка NTFS DISM команд, SoftPerfect RAM Disk и аналоги) с буквой Z размером не менее 14000МБ.
- Скачать указанные в Релизе нужный образ. Образ должен быть смонтирован, но не находится на диске Z, если диск минимального размера.
- Распаковать скрипты, файлы install.wim и boot.wim (из папки source файла .iso) в корень диска Z.
- В случае отличия языка системы от русского, заменить в _Clear.bat «ru-RU», в блоке OneDrive, на свою версию.
- Запустить _Clear.bat и ожидать завершение работы окна.
- Убедится в отсутствии ошибок в файле Clear.log по поиску: «операция», «оши», «не », «нет» (не все строчки являются ошибками, внимательно читайте их описание).
- Запустить CMD и выполнить первую команду из файла _Readme.txt.
- С помощью UltraISO (или аналогов) удалить в .iso образе файл install.wim и добавить получившийся install.esd и boot.wim.
- Образ готов.

# Application:
- You will need any disk (if RAM, then you need support for NTFS DISM commands, SoftPerfect RAM Disk and analogues) with the letter Z and a size of at least 14000MB.
- Download the required image specified in the Release. The image must be mounted, but not located on the Z drive if the drive is the minimum size.
- Unpack the scripts, install.wim and boot.wim files (from the source folder of the .iso file) to the root of the Z drive.
- If the system language differs from Russian, replace “ru-RU” in _Clear.bat, in the OneDrive block, with your version.
- Run _Clear.bat and wait for the window to finish.
- Make sure there are no errors in the Clear.log file by searching: “operation”, “errors”, “not”, “no” (not all lines are errors, read their description carefully).
- Launch CMD and execute the first command from the _Readme.txt file.
- Using UltraISO (or analogues), delete the install.wim file in the .iso image and add the resulting install.esd and boot.wim.
- The image is ready.

# 应用：
- 您将需要任何带有字母 Z 且大小至少为 14000MB 的磁盘（如果是 RAM，则需要支持 NTFS DISM 命令、SoftPerfect RAM 磁盘和类似磁盘）。
- 下载版本中指定的所需映像。 如果驱动器是最小大小，则必须安装映像，但不能将映像定位在 Z 驱动器上。
- 将脚本、install.wim 和 boot.wim 文件（来自 .iso 文件的源文件夹）解压到 Z 驱动器的根目录。
- 如果系统语言与俄语不同，请将 OneDrive 块中 _Clear.bat 中的“ru-RU”替换为您的版本。
- 运行 _Clear.bat 并等待窗口完成。
- 通过搜索“operation”、“errors”、“not”、“no”确保 Clear.log 文件中没有错误（并非所有行都是错误，请仔细阅读其描述）。
- 启动 CMD 并执行 _Readme.txt 文件中的第一个命令。
- 使用 UltraISO（或类似工具），删除 .iso 映像中的 install.wim 文件并添加生成的 install.esd 和 boot.wim。
- 图像已准备好。

# Установка:
Стандартная. Только чистая установка. Во время установки данного образа должен быть выключен интернет, пока система не будет автоматически 2 раза перезагружена. Это связано с тем, что вторая часть скриптов срабатывает только после перезагрузки, после создания первой учетной записи. В промежуток когда этого еще не произошло windows скачивает все, что ей прикажет центр обновлений.  
После установки на рабочем столе будет присутствовать опциональный набор замены всех системных иконок от Windows 7. Прочтите _Readme.txt для его применения.

# Installation:
Standard. Clean installation only. During installation of this image, the Internet must be turned off until the system is automatically rebooted 2 times. This is due to the fact that the second part of the scripts works only after a reboot, after creating the first account. During the interval when this has not yet happened, Windows downloads everything that the update center tells it to do.  
After installation, an optional set of replacing all system icons from Windows 7 will be present on the desktop. Read _Readme.txt to use it.

# 安装：
标准。 仅干净安装。 安装此映像期间，必须关闭 Internet，直到系统自动重新启动 2 次。 这是因为脚本的第二部分仅在创建第一个帐户后重新启动后才起作用。 在这尚未发生的时间间隔内，Windows 会下载更新中心指示其执行的所有操作。  
安装后，桌面上将出现一组替换 Windows 7 中所有系统图标的可选设置。请阅读 _Readme.txt 以使用它。

# Обслуживание:
Некоторые элементы кастомизации вынесены в отдельную утилиту обслуживания [WinTool](https://github.com/Mitradis/DISM-Scripts-Tools)  (Пуск - Все программы - Служебные).  
В этой утилите возможно изменить некоторые внесенные набором изменения:  
- переключать поддержку установки .appx пакетов (после того как они установлены с драйверами),
- переключать службу Брандмауэра Windows (требуется для .appx),
- переключать пункты контекстного меню,
- делать сброс и очистку реестра от ненужных или устаревших записей проводника\микшера\совместимости,
- выполнять команду flushDNS,
- обновлять корневые сертификаты,
- переключать UAC,
- переключать работу функции Win+Shift+S,
- переключать возможность обновления Edge,
- включать\отключать стандартный Пуск,
- переключать элементы в "Этот компьютер".

Все функции полностью безопасны и используют исключительно стандартные методы и исполняемые файлы самой ОС без повышения прав.

# Service:
Some customization elements are placed in a separate maintenance utility [WinTool](https://github.com/Mitradis/DISM-Scripts-Tools) (Start - All Programs - Utilities).
In this utility it is possible to change some of the changes made by the kit:
- toggle support for installing .appx packages (after they are installed with drivers),
- switch Windows Firewall service (required for .appx),
- switch context menu items,
- reset and clean the registry of unnecessary or outdated Explorer\Mixer\Compatibility entries,
- execute the flushDNS command,
- update root certificates,
- switch UAC,
- switch the function Win+Shift+S,
- toggle the ability to update Edge,
- enable/disable standard Start,
- switch items in "This PC".

All functions are completely safe and use exclusively standard methods and executable files of the OS itself without elevation of rights.

# 服务：
一些自定义元素放置在单独的维护实用程序 [WinTool](https://github.com/Mitradis/DISM-Scripts-Tools) 中（开始 - 所有程序 - 实用程序）。
在此实用程序中，可以更改套件所做的一些更改：
- 切换对安装 .appx 软件包的支持（安装驱动程序后），
- 切换 Windows 防火墙服务（.appx 所需），
- 切换上下文菜单项，
- 重置并清理注册表中不必要或过时的 Explorer\Mixer\Compatibility 条目，
- 执行flushDNS命令，
- 更新根证书，
- 切换UAC，
- 切换功能Win+Shift+S,
- 切换更新 Edge 的能力，
- 启用/禁用标准启动，
- 切换“这台电脑”中的项目。

所有功能都是完全安全的，并且仅使用操作系统本身的标准方法和可执行文件，无需提升权限。

# Активация\Activation\激活
[Microsoft Activation Scripts](https://github.com/massgravel/Microsoft-Activation-Scripts/tree/master)  
Внимание: использовать только метод активации KMS38 (3). Другие методы включают отключенные набором службы обновлений.  
Attention: use only KMS38 activation method (3). Other methods enabled disabled by the kit update services.  
注意：仅使用KMS38激活方法（3）。 其他方法包括由该组禁用更新服务。

Set stream = CreateObject("ADODB.Stream")
' 74 1F 48 63 D0 48 8D 0D C9 10 03 00 48 C1 E2 04 48 03 D1 48 8B CF 48 89 57 58 8B D0 E8 24 02 00 00
find2 = Chr(116)&Chr(31)&Chr(72)&Chr(99)&ChrW(208)&Chr(72)&ChrW(141)&Chr(13)&ChrW(201)&Chr(16)&Chr(3)&Chr(0)&Chr(72)&ChrW(193)&ChrW(226)&Chr(4)&Chr(72)&Chr(3)&ChrW(209)&Chr(72)&Chr(139)&ChrW(207)&Chr(72)&Chr(137)&Chr(87)&Chr(88)&Chr(139)&ChrW(208)&ChrW(232)&Chr(36)&Chr(2)&Chr(0)&Chr(0)
' 00 00 00 00 00 43 00 4E 00 00 00 00 00
find3 = Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(67)&Chr(0)&Chr(78)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0)
stream.Open
stream.Type = 2
stream.Charset = "Windows-1252"
stream.LoadFromFile WScript.Arguments(0)
data = stream.ReadText
stream.Close
If (CreateObject("Scripting.FileSystemObject").FileExists(CreateObject("WScript.Shell").ExpandEnvironmentStrings("%windir%\ru-RU\explorer.exe.mui"))) Then
	lang = "RU"
Else
	lang = "EN"
End If
If InStr(WScript.Arguments(0), "InputSwitch.dll") > 0 And InStr(data, find2) > 0 Then
	data = Replace(data, find2, ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144))
	replaced = True
ElseIf InStr(WScript.Arguments(0), "SystemSettings.dll") > 0 And InStr(data, find3) > 0 Then
	if lang = "RU" Then
		data = Replace(data, find3, Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(82)&Chr(0)&Chr(85)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0))
		replaced = True
	Else
		data = Replace(data, find3, Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(85)&Chr(0)&Chr(83)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0))
		replaced = True
	End If
End If
if replaced Then
	stream.Open
	stream.Type = 2
	stream.Charset = "Windows-1252"
	stream.WriteText data
	stream.SaveToFile WScript.Arguments(1), 2
	stream.Close
	result = True
End If
if lang = "RU" Then
	if result Then
		WScript.Echo "???????? ?????? ?????????."
	Else
		WScript.Echo "?????? ????????."
	End If
Else
	if result Then
		WScript.Echo "Replace operation success."
	Else
		WScript.Echo "Operation error."
	End If
End If
Set stream = Nothing

GOTO TEST







%~dp0run.exe 0 calc.exe
Run.exe 1024 "notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
Run.exe 0 "notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
Run.exe 1028 "notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1030 -cmd:"notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
:: BROKEN = run.exe /int:0 /cmd:"notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
:: BROKEN = run.exe -int:0 -cmd:"notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
:: Works = run.exe 0 "notepad.exe ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
:: Works = powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:"notepad.EXE F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
:: Works = run.exe 16 """C:\Program Files\Internet Explorer\iexplore.exe"" about:blank"
:: Works = run.exe 1072 """C:\Program Files\Internet Explorer\iexplore.exe"" about:blank"
:: Works = run.exe 32 "Control.exe mmsys.cpl"
:: Works = powershell.exe -exec bypass -f "%~dp0run.ps1" -cmd:"notepad.EXE F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx" -int:4
:: Works = run.exe -Cmd:"notepad2.exe ""%~dp0readme.md""" -Int:36
:: Works = run.exe "notepad2.exe ""%~dp0readme.md""" -int:0
:: Works = run.exe "notepad2.exe ""%~dp0readme.md"""
:: Works = c:\Windows\SysWOW64\cmd.exe /c powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1088 -cmd:regsvr32.exe
:: BROKEN = c:\Windows\SysWOW64\cmd.exe /k powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1088 -cmd:"regsvr32.exe "C:\Program Files\Carestream\PACS\wn0pacs\mpi.dll" "
:: Works = run.exe -int:1088 -cmd:"regsvr32.exe ""C:\Program Files\Carestream\PACS\wn0pacs\mpi.dll"""
:: Works = c:\Windows\SysWOW64\cmd.exe /k powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1088 -cmd:"regsvr32.exe ""C:\Program Files\Carestream\PACS\wn0pacs\mpi.dll"""
:: Works = run.exe -int:1088 -cmd:"regsvr32.exe ""C:\Program Files\Carestream\PACS\wn0pacs\mpi.dll"""
:: Works = c:\Windows\SysWOW64\cmd.exe /k powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1088 -cmd:"regsvr32.exe ""C:\Program Files\Carestream\PACS\wn0pacs\mpi.dll"""
:: Works = c:\Windows\SysWOW64\cmd.exe /k powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1088 -cmd:"reg.exe import ""%%LOGONSERVER%%.%%USERDNSDOMAIN%%\NetLogon\%%CUSTOMER%%\StupidConfig.reg"""
:: Works = "%~dp0run.exe" 1088 "reg.exe import ""%%LOGONSERVER%%.%%USERDNSDOMAIN%%\NetLogon\%%CUSTOMER%%\StupidConfig.reg"""
:: Works = "%~dp0run.exe" 1024 "reg.exe import ""%%LOGONSERVER%%.%%USERDNSDOMAIN%%\NetLogon\%%CUSTOMER%%\StupidConfig.reg"""
:: Works = "%~dp0run.exe" 1088 "reg.exe import ""%%LOGONSERVER%%.%%USERDNSDOMAIN%%\NetLogon\%%CUSTOMER%%\StupidConfig.reg"""
:: Works = powershell.exe -exec bypass -f "%~dp0run.ps1" 0 notepad.exe "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
:: Works = powershell.exe -exec bypass -f "%~dp0run.ps1" 1024 notepad.exe "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
:: Works = "%~dp0run.exe" 1024 notepad.exe "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
:: Works = "%~dp0run.exe" 1024 "notepad.exe ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
:: Works = powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:notepad.EXE "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx" 
:: FAILS, hard - too many args = powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:notepad.EXE "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx" "F:\Packages\System\Packaging\icacls.txt"

:: 2022-03-08: Works great:
F:\Packages\System\Packaging\RunV3\run\Run.exe 1024 F:\Packages\System\AutoIt\AutoIt3\AutoIt3.exe F:\Packages\System\AutoIt\CoookieClickerScript.au3
Received command: [f:\packages\system\autoit\autoit3\autoit3.exe]
Concatenating argument overflow [F:\Packages\System\AutoIt\CoookieClickerScript.au3] after []

"%~dp0run.exe" 1024 "powershell.exe -exec bypass -nop -f F:\Packages\Games\Minecraft\MC.Server.Startup.ps1"
Received command: [powershell.exe -exec bypass -nop -f f:\packages\games\minecraft\mc.server.startup.ps1]
Converted to: [powershell.exe -exec bypass -nop -f f:\packages\games\minecraft\mc.server.startup.ps1]

why does this 'catch' cmd=run.exe and not powershell.exe:
"%~dp0run.exe" 1024 "powershell.exe -exec bypass -nop -f F:\Packages\Games\Minecraft\MC.Server.Startup.ps1"
this works perfectly - cmd=notepad and args is the rest:
"%~dp0run.exe" 1024 notepad.exe "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"

"%~dp0run.exe" 1024 "powershell.exe -exec bypass -nop -f F:\Packages\Games\Minecraft\MC.Server.Startup.ps1"
Received command: [
powershell.exe -exec bypass -nop -f f:\packages\games\minecraft\mc.server.startup.ps1]
Converted to: [ll.exe]
Arguments: [-exec bypass -nop -f f:\packages\games\minecraft\mc.server.startup.ps1]
%~dp0run.exe 1024 "powershell.exe -exec bypass -nop -f F:\Packages\Games\Minecraft\MC.Server.Startup.ps1"
NOW THIS WORKS:
powershell.exe -exec bypass -nop -file "%~dp0run.ps1" 1024 "powershell.exe -exec bypass -nop -f F:\Packages\Games\Minecraft\MC.Server.Startup.ps1"
%~dp0run.exe 1024 "powershell.exe -exec bypass -nop -f F:\Packages\Games\Minecraft\MC.Server.Startup.ps1"
powershell.exe -exec bypass -nop -file "%~dp0run.ps1" 1024 C:\Windows\System32\notepad.exe

"%~dp0run.exe" 1024 "notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
powershell.exe -exec bypass -f "%~dp0run.ps1" 0 notepad.exe "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
:TEST
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:notepad.EXE "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"

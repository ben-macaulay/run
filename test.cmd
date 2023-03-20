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
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:notepad.EXE "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"

2022-06-24: Experimenting with ValueFromRemainingArguments
Even an .LNK with this doesn't work: cmd.exe /k start "test window" /wait notepad.EXE "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
What happens is a window titled test is created... I need some better tests.

THIS FINDS THE .PS1 BUT BAILS OUT IMMEDIATELY WITH NO ERROR OR ANYTHING.
PROCMON CONFIRMS THE .PS1 IS ACCESSED, BUT NOT THE .XML FILE IT OPENS: "%~dp0run.exe" 0 "powershell.exe -nologo -file ""F:\Packages\Games\Valorant\ValorantLauncher.ps1"""
Yet this actually works fine!!!  powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:"powershell.exe -nologo -file ""F:\Packages\Games\Valorant\ValorantLauncher.ps1"""
So my compiled PoSh isn't actually running posh stuff like  I think it should, unfortunately.
IM AN IDIOT AND FORGOT -EXEC BYPASS!
"%~dp0run.exe" 0 "powershell.exe -exec bypass -f ""F:\Packages\Games\Valorant\ValorantLauncher.ps1"""
"%~dp0run.exe" -int:1024 -cmd:"cmd.exe /k start ""test window"" /wait notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""

17/03/2023:
echo testing 64-bit stuff!! (set custom ODBC regkeys!)
"%~dp0run.exe" -int:1088 -cmd:"cmd.exe /k reg.exe query hklm\software\odbc\odbc.ini"
(finds the 64-bit branch!)

"%~dp0run.exe" -int:1024 -cmd:"cmd.exe /k reg.exe query hklm\software\odbc\odbc.ini"
(finds the 32-bit branch!)

This also works - using the 3rd argument for overflow:
powershell.exe -exec bypass -file "%~dp0run.ps1" 1088 "cmd.exe" "/k reg.exe query ""hklm\software\odbc\odbc.ini"""
"%~dp0run.exe" 1088 "cmd.exe" "/k reg.exe query ""hklm\software\odbc\odbc.ini"""

@ work:
Didn't work - doesn't interpret -init: "%~dp0run.exe" 0 "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" -init -poll exit
Works beautifully!: "%~dp0run.exe" 0 "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe -init -poll exit"
Didn't work - doesn't interpret -init: "%~dp0run.exe" 1024 "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" "-init -poll exit"
Trims arguments as above (finds .EXE and takes the right for Args) : "%~dp0run.exe" 1024 """C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe"" -init -poll exit"
Doesn't have a param arg for -init (doesn't go to overflow): "%~dp0run.exe" -int:1024 -c:"C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" -init -poll exit
"%~dp0run.exe" -int:1024 -cmd:"C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" -overflow:"-init -poll exit"

REM back at home again. ValueFromRemainingArguments = $true)][string[]]$Overflow  
REM Both these seem to work OK:
powershell.exe -exec bypass -file "%~dp0run.ps1" 1024 "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" -init -poll exit
powershell.exe -exec bypass -file "%~dp0run.ps1" 1024 "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" "-init -poll exit"
"%~dp0run.exe" 1024 "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" -init -poll exit
"%~dp0run.exe" 0 "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" -init -poll exit
"%~dp0run.exe" -int:1088 -cmd:"cmd.exe /k reg.exe query hklm\software\odbc\odbc.ini"
"%~dp0run.exe" 1024 -cmd:"cmd.exe /k reg.exe query hklm\software\odbc\odbc.ini"
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1024 -cmd:"notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1024 -cmd:notepad.EXE "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
run.exe notepad2.exe "%~dp0readme.md" -int:1024
is 8.3 converting?!  YES!
powershell.exe -exec bypass -f "%~dp0run.ps1" 1040 "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe" -init -poll exit
REM Sorta works, doesn't 8.3 the arguments, 'cos I can't be bothered building a function to sift through args and checkingfor files and converting their path: powershell.exe -exec bypass -nop -file "%~dp0run.ps1" 1040 "C:\Program Files\DIFX\4A7292F75FEBBD3C\tool_amd64.exe" /d "C:\Program Files\DIFX\4A7292F75FEBBD3C"
Still works: powershell.exe -exec bypass -nop -file "%~dp0run.ps1" 1024 "cmd.exe" "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
Doesn't work:run.exe 1024 "cmd.exe" /k reg.exe query "HKLM\software\Microsoft\Windows NT\CurrentVersion"
DOES WORK:powershell.exe -exec bypass -nop -file "%~dp0run.ps1" 1024 cmd.exe /k reg.exe query """HKLM\software\Microsoft\Windows NT\CurrentVersion"""
DOES WORK:powershell.exe -exec bypass -nop -file "%~dp0run.ps1" 1024 cmd.exe "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
powershell.exe -exec bypass -nop -file "%~dp0run.ps1" -c:cmd.exe -i 1024 "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
DOESNT WORK - NEEDS INT OR OVERFLOW: %~dp0run.exe -c:cmd.exe "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
WORKS:%~dp0run.exe -c:cmd.exe -o:"/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
WORKS:%~dp0run.exe 0 cmd.exe "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
WORKS:run.exe 1024 cmd.exe -o"/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
WORKS:run.exe 1024 cmd.exe "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
WORKS:"%~dp0run.exe" 128 https://old.reddit.com/r/sysadmin
:TEST
pause

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



Dec 2023 - another run at work playing around.
Works:\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\run.exe 1024 """C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin\SelfService.exe"" -init -poll exit"
Works if CD is \Root\: C:\ProgramData\Microsoft\AppV\Client\Integration\0728CF83-9E9C-43D4-988B-3B3288C4C400\Root\Run.exe 1056 "powershell.exe -nop -exec bypass -win Minimized -f Run-Alamut.ps1"

8.3 + wait 
\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\run.exe 1072 D:\AppV\5e3f30b4-a392-4598-a87f-2f286b8e8b3f\77077cdf-0ee4-4838-b25a-833a223306ab\Root\Duerr\VistaScan\VistaScanConfig.exe
no systray, which is odd...  Ctx being a dick?
\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\run.exe 1073 D:\AppV\5e3f30b4-a392-4598-a87f-2f286b8e8b3f\77077cdf-0ee4-4838-b25a-833a223306ab\Root\Duerr\VistaScan\VistaScanConfig.exe


Doesn't Work -w: isn't being caught:
\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\run.exe -i:1024 -c:SelfService.exe -a:"-init -poll exit" -w:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\run.exe -i:1024 -c:SelfService.exe -a:"-init -poll exit" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
...also doesn't Work -WkDir: isn't being caught
\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\run.exe -int:1024 -cmd:SelfService.exe -arguments:"-init -poll exit" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
...also doesn't Work -WkDir: isn't being caught

powershell.exe -exec bypass -nop -file "\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run.ps1" -int:1024 -cmd:SelfService.exe -arguments:"-init -poll exit" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
can't dot-source?!  Is it applocker?
powershell.exe -exec bypass -nop -file "C:\ProgramData\Microsoft\AppV\Client\Integration\0728CF83-9E9C-43D4-988B-3B3288C4C400\Root\Run.ps1" -int:1024 -cmd:SelfService.exe -arguments:"-init -poll exit" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
can't dot-source?!

Applocker was always going to make .PS1 unuseable :(
Try running on jumphost server:
powershell.exe -exec bypass -nop -file "\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run.ps1" -int:1024 -cmd:cmd.exe -arguments:"/k dir /x" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
Runs OK, and WkDir is handled as an arg properly (?!?) but doesn't splat accross to start-process?!n\0728CF83-9E9C-43D4-988B-3B3288C4C400\Root\Run.ps1" -int:1024 -cmd:SelfService.exe -arguments:"-init -poll exit" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
Output:
    Received Arguments: [/k dir /x]
    Received Working directory: [C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin]

    Start-Process : This command cannot be run because either the parameter "WorkingDirectory" has a value that is not
    valid or cannot be used with this command. Give a valid input and Run your command again.
    At \\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run.ps1:351 char:19


Try again with .EXE:"\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run.exe" -int:1024 -cmd:cmd.exe -arguments:"/k dir /x" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
chokes on wkDir - Received Working directory: [-WkDirC:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin]

Made -WkDir handle stripping the argname
"\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run.exe" -int:1024 -cmd:cmd.exe -arguments:"/k dir /x" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
    Would be good but jumphost doesn't have the citrix client installed, silly!
"\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run.exe" -int:1024 -cmd:cmd.exe -arguments:"/k dir /x" -WkDir:"C:\Program Files (x86)"
    Works great!

Testing on citrix host:
\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\run.exe -int:1024 -cmd:SelfService.exe -arguments:"-init -poll exit" -WkDir:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
    works beautifully!

\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\run.exe -int:1024 -cmd:SelfService.exe -arguments:"-init -poll exit" -W:"C:\Program Files (x86)\Citrix\Online Plugin\ICA Client\SelfServicePlugin"
    works beautifully!


On jumphost, testing PoSh again:
powershell.exe -exec bypass -nop -file "\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run.ps1" -int:1024 -cmd:cmd.exe -arguments:"/k dir /x" -WkDir:"C:\Program Files (x86)"
    Received Working directory: [\Program Files (x86)]
PoSh takes the arguments differently, when compiled they're '-Wkdir:"blah"', not '"blah"'...
    ...fix that handling if WkDir.StartsWith('-')

powershell.exe -exec bypass -nop -file "\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run.ps1" -int:1024 -cmd:cmd.exe -arguments:"/k dir /x" -W:"C:\Program Files (x86)"
\\wn0packages\Packages\_EUC\SourceControl\RunV3\run\Run -int:1024 -cmd:cmd.exe -arguments:"/k dir /x" -W:"C:\Program Files (x86)"
    These work well :)

"%~dp0run.exe" -int:1024 -cmd:cmd.exe -arguments:"/k dir /x" -W:"C:\Program Files (x86)"
"%~dp0run.exe" -int:1024 -cmd:cmd.exe -arguments:"/k dir /x ""C:\Program Files (x86)"""

F:\Packages\System\Packaging\RunV3\run\run.exe -int:1024 -cmd:"F:\Packages\System\Autohotkey\AutoHotkey\AutoHotkeyU32.exe" -arguments:"F:\Users\ben\My Documents\AutoHotkey.ahk"
    Found not working 'cos of the space in the arguments - do we need to carefully wrap it in quotes or something?
F:\Packages\System\Packaging\RunV3\run\run.exe -int:1024 -cmd:"F:\Packages\System\Autohotkey\AutoHotkey\AutoHotkeyU32.exe" -arguments:"F:\Users\ben\My Documents\AutoHotkey.ahk"
    Works after including the WkDir fix and handling the quotes
:TEST
F:\Packages\System\Packaging\RunV3\run\run.exe -int:1024 -cmd:"F:\Packages\System\Autohotkey\AutoHotkey\AutoHotkeyU32.exe" -a:"F:\Users\ben\My Documents\AutoHotkey.ahk"
pause

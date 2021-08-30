GOTO TEST







%~dp0run.exe 0 calc.exe
Run.exe 1024 "notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
Run.exe 0 "notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
Run.exe 1028 "notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:1030 -cmd:"notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
:TEST
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

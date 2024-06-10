Set VER=0.0.3.9
powershell.exe -exec bypass -nop -c "ps2exe -inputFile %~dp0run.ps1 -outputFile %~dp0Run.exe -iconFile %~dp0cog.ico -noConsole -title RunV3 -version %VER% -x86 -Description 'https://github.com/ben-macaulay/run' -Company 'GPLv3' -product Run"
@ping 127.0.0.1 -n 3 >nul
:: -noerror
:: pause


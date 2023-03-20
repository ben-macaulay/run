powershell.exe -exec bypass -c "ps2exe -inputFile %~dp0run.ps1 -outputFile %~dp0Run.exe -iconFile %~dp0cog.ico -noConsole -title "RunV3" -version 0.0.3.1 -x86"
@ping 127.0.0.1 -n 3 >nul
:: -noerror
:: pause


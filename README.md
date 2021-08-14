Usage:
    Run.exe [Int] [Command]
    Run.ps1 -int:[Int] -Command:[Command]
Once the command has been started, a system try icon/cog appears which can be used to present the Int and Command interpretations.
Non-existent .EXE commands will error with a missing file dialog.
Add Int options below for combinations as required.  Some conflict, testing is required...
==============================================================================


Possible Int values are combinations of:
    1: Systray icon off (Systray icon is on by default, unless using #1 or #32)
    2: Run [Command] in a hidden window
    4: Run [Command] in a minimised window (not everything actually supports/honours this)
    8: Run [Command] in a maximised window
    16: Convert [Command] so it uses 8.3 paths - This only applies to the .EXE and won't convert 'argument' paths to 8.3.
    32: Wait for [Command] to complete (otherwise, waits for 10s before exiting).  This disables systray like #1.
    64: Run [Command] in a the default browser (supply a URL to the users preferred http handler)
  1024: Display a debug message prior to launching [Command].  Useful if using #1 or #32 (or don't have a taskbar?)
==============================================================================
  

A note about Command getting complicated:
Don't forget quotes around your URL / Path. If your path has spaces, you may need to duplicate your quotes, E.g:
    Run.exe "MSACCESS.EXE ""{UNCPath\File.mde}"""
Of course, this is problematic (at best) and behaves differently if calling the .PS1 as opposed to the .EXE.  It is assumed that you are using the .EXE henceforth...
==============================================================================


Examples:
Works: run.exe 0 "notepad.exe ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
Works: powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:"notepad.EXE F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
DOESNT WORK:powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:"notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
    (struggles with double quotes for some dumb reason!)
Works = run.exe 32 "Control.exe mmsys.cpl"
Works = run.exe 1072 """C:\Program Files\Internet Explorer\iexplore.exe"" about:blank"


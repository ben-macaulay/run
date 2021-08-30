# Run

**What and why**

Run.exe is a silly tool for overcomplicated environments where an App-V package contains files that aren't used in the launching process.

Consider a bubble for an ActiveX control, or a launch script that resides on a network share, for example.

Instead of figuring out which App-V bubble to launch the process within, Run.exe is added to application install during sequencing and then launching whatever is packaged via the embedded Run.exe, this causes the App-V client to use the appropriate bubble for the IE11 window or whatever the package is for...

**How**

The automated application sequencing script creates a GUID directory for the PVAD and copies Run.exe into this as part of the installation.

The assumption is that the App-V entrypoints are suppressed in the deployment configuration .XML files and instead published shortcuts are used...

**Usage:**
```
    Run.exe [Int] [Command]
    Run.ps1 -int:[Int] -cmd:[Command]
```
It is assumed that Int is the first argument and needs to be a number.  If in doubt, use ```Runexe 0 "{Command}"``` or qualify them with ```-Int:``` and ````-Cmd:````

Non-existent .EXE commands will error with a missing file dialog.

Once the command has been started, a system try icon/cog appears which can be used to present the Int and Command interpretations.

# 

**Int options**

Add ```-Int``` options below for combinations as required.  Some conflict, testing is required...  Examples are further below.

Possible Int values are various combinations of:
 - +1: Systray icon off (Systray icon is on by default, unless using #1 or #32)
 - +2: Run [Command] in a hidden window
 - +4: Run [Command] in a minimised window (not everything actually supports/honours this)
 - +8: Run [Command] in a maximised window
 - +16: Convert [Command] so it uses 8.3 paths - This only applies to the .EXE and won't convert 'argument' paths to 8.3.
 - +32: Wait for [Command] to complete (otherwise, waits for 10s before exiting).  This disables systray like #1.
 - +64: Run [Command] in a the default browser (supply a URL to the users preferred http handler)
 - +1024: Display a debug message prior to launching [Command].  Useful if using #1 or #32 (or don't have a taskbar?)

#

A note about ```[cmd]``` getting complicated:
Don't forget quotes around your URL / Path. If your path has spaces, you may need to duplicate your quotes, E.g:
```
Run.exe "MSACCESS.EXE ""{UNCPath\File.mde}"""
```
Of course, this is problematic (at best) and behaves differently if calling the .PS1 as opposed to the .EXE.  It is assumed that you are using the .EXE henceforth...

#

## Examples
**Each of these work:**
```
run.exe 0 "notepad.exe ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""

powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:"notepad.EXE F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"

run.exe 32 "Control.exe mmsys.cpl"

run.exe 1072 """C:\Program Files\Internet 
Explorer\iexplore.exe"" about:blank"

run.exe "notepad2.exe ""%~dp0readme.md""" -int:0
```
**DOESNT WORK:**
```
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:"notepad.EXE ""F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"""
```
- (this struggles with double quotes for some dumb reason!)

#

## TODO
I plan to compile this with an additional option to call either the 64-bit paths (via $env:Windir\Sysnative\) or the 32-bit paths (via SysWow64) - famous last words of course...  
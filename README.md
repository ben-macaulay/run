# Run

**What and why**

Run.exe is a silly tool for overcomplicated environments (where an App-V package contains files that aren't used in the launching process, and the native shortcut cannot be published).

Consider a bubble for an ActiveX control, or a launch script that resides on a network share, for example.

Instead of figuring out which App-V bubble to launch the process within, Run.exe is added to application install during sequencing.  Then launching 'whatever is packaged' via the embedded Run.exe causes the App-V client to use the appropriate bubble for the IE11 window or whatever the package is for...

**How**

The automated application sequencing script creates a GUID directory for the PVAD and copies Run.exe into this as part of the installation.

The assumption is that the App-V entrypoints are suppressed in the deployment configuration .XML files and instead published shortcuts are used via Citrix...

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
 - +16: Convert [Command] so it uses 8.3 paths - This only applies to the .EXE and won't convert 'argument' paths to 8.3.  Supply the full path: C:\Program Files\Internet Explorer\Iexplore.exe.
 - +32: Wait for [Command] to complete (otherwise, waits for 5 seconds before exiting).  This disables systray as per +1.
 - +64: Experimental 64-bit support (Run.exe is compiled as 32-bit by default). Launch [Command] using $Env:Windir\Sysnative (via WoW64 redirection) - you'll need to pass something like reg.exe for it to 'hit' the x64 binaries.
 - +128: Run [Command] in a the default browser (supply a URL to the users preferred http handler)
 - +1024: Display a debug message prior to launching [Command].  Useful if using #1 or #32 (or don't have a taskbar?)

#

A note about ```[cmd]``` getting complicated:
Don't forget quotes around your URL / Path. If your path has spaces, you may need to duplicate your quotes, E.g:
```
Run.exe "MSACCESS.EXE ""{UNCPath\File.mde}"""
```
Of course, this is problematic (at best) and behaves differently if calling the .PS1 as opposed to the .EXE.  It is assumed that you are using the .EXE henceforth...

Another approach when quotes get complicated is to not qualify the parameter names, so the 0 is for the Integer and the rest is passed through.  The script makes use of an overflow parameter and 'tacks these on' the end:
```
powershell.exe -exec bypass -f "%~dp0run.ps1" 0 notepad.exe "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
```
This is usually successful, but I would'nt be surprised if an unintended limitation exists, somewhere...  It really only works for the third parameter.

#

## Examples

Wade through testing.cmd for a more exhaustive list.

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
- (this struggles with double quotes for some dumb reason)  Instead, try using:

**Works:**

```
powershell.exe -exec bypass -f "%~dp0run.ps1" 0 notepad.exe "F:\Packages\System\Packaging\Interview Questions\Packager Technical questions.docx"
```


#

## TODO
I plan to: 

* have another attempt at the 8.3 support and look for periods in the arguments in case I can convert those as well...
* Extend the parameter handling so that the script passes third and fourth parameters to [Cmd], assuming it's something quirky like a rundll32.exe call or something awful like javaw.exe -jar [file] -Xms1024M -Xmx4096M, etc.
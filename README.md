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
    Run.exe [Int] [Command] [Overflow]
    Run.ps1 -int:[Int] -cmd:[Command] -overflow:[Overflow]
    Run.exe -i:[Int] -c:[Command] -o:[Overflow parameters/files, etc.]
```
It is assumed that Int is the first argument and needs to be a number.  If in doubt, use ```Run.exe 0 "{Command}"``` or qualify them with ```-Int:|-i:``` and ````-Cmd:|-c:```` and optionally ````-Overflow:|-o:````

Non-existent .EXE commands will error with a missing file dialog.

Once the command has been started, a system try icon/cog appears which can be used to present the Int and Command interpretations.

# 

**Int options**

Add ```-Int``` options below for combinations as required.  Some conflict, testing is required...  Examples are further below.

Possible Int values are various combinations of:
 - **+1**: Systray icon off (Systray icon is on by default, unless using #1 or #32)
 - **+2**: Run [Command] in a hidden window
 - **+4**: Run [Command] in a minimised window (not everything actually supports/honours this)
 - **+8**: Run [Command] in a maximised window
 - **+16**: Convert [Command] so it uses 8.3 paths - This only applies to the .EXE and won't convert 'argument' paths to 8.3.  Supply the full path: C:\Program Files\Internet Explorer\Iexplore.exe.
 - **+32**: Wait for [Command] to complete (otherwise, waits for 5 seconds before exiting).  This disables systray as per +1.
 - **+64**: Semi-experimental 64-bit support (Run.exe is compiled as 32-bit by default). Launch [Command] using $Env:Windir\Sysnative (via WoW64 redirection) - you'll need to pass something like reg.exe for it to 'hit' the x64 binaries.  Only works for System32 paths and won't convert an argument/parameter to an 8.3 path - this relies on the script finding the [Command] and asking the OS for it's 8.3-equivalent path.
 - **+128**: Run [Command] in a the default browser (supply a URL to the users preferred http handler)
 - **+1024**: Display a debug message prior to launching [Command].  Useful if using #1 or #32 (or don't have a taskbar?)

#

A note about ```[cmd]``` getting complicated:

As of v3.1, use the overflow arguments happily. Additionally, providing the Int parameter means the script can focus on the real work (and it's often shorter than dabbling with -c: and -o:).

Still not perfect and you may need to remember quotes around your URL / Path. If your path has spaces, you may need to duplicate your quotes, E.g:
```
Run.exe 0 MSACCESS.EXE "{UNCPath\File.mde}"

Run.exe 0 "MSACCESS.EXE ""{UNCPath\File.mde}"""
```
Of course, this is problematic (at best) and behaves differently if calling the .PS1 as opposed to the .EXE.  It is assumed that you are using the .EXE henceforth...

Another approach when quotes get complicated is to not qualify the parameter names, so the 0 is for the Integer and the rest is passed through.  The script makes use of an overflow parameter and 'tacks these on' the end:
```
powershell.exe -exec bypass -f "%~dp0run.ps1" 0 notepad.exe "F:\Complicated\unnecessarily long\path\file name.txt"
```
This is usually successful, but I would'nt be surprised if an unintended limitation exists, somewhere...  It really only works for the third parameter.

#

## Examples

Wade through testing.cmd for a more exhaustive list.

**Each of these work:**
```
run.exe 0 "notepad.exe ""F:\Complicated\unnecessarily long\path\file name.txt"""

powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:"notepad.EXE F:\Complicated\unnecessarily long\path\file name.txt"

run.exe 32 "Control.exe mmsys.cpl"

run.exe 1072 """C:\Program Files\Internet Explorer\iexplore.exe"" about:blank"

run.exe "notepad2.exe ""%~dp0readme.md""" -int:0

run.exe notepad2.exe "%~dp0readme.md" -int:0

powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:"notepad.EXE ""F:\Complicated\unnecessarily long\path\file name.txt"""
```
**or** some equivalent variants:
```
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:notepad.EXE "F:\Complicated\unnecessarily long\path\file name.txt"

powershell.exe -exec bypass -f "%~dp0run.ps1" 0 notepad.exe "F:\Complicated\unnecessarily long\path\file name.txt"
"%~dp0run.exe" 0 "notepad.EXE ""F:\Complicated\unnecessarily long\path\file name.txt"""

"%~dp0run.exe" -int:0 -cmd:"notepad.EXE ""F:\Complicated\unnecessarily long\path\file name.txt"""
```
A browser-based example:
```
run.exe 128 http://stupid.intranet.url/legacypath
```
#
## DONE 
(I think?)

I've extended the parameter handling so that the script passes third and fourth parameters to [Cmd], assuming it's something quirky like a rundll32.exe call or something awful like javaw.exe -jar [file] -Xms1024M -Xmx4096M, etc.

I _have_ found that this works well **IF** the cmd and args are in separate parameters: 
  ```
  run.exe 1088 "cmd.exe" "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""...
  run.exe 1024 cmd.exe "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
  run.exe 1024 cmd.exe -o"/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
  ```
#
## TODO
I plan to: 

* have another attempt at the 8.3 support and look for periods in the arguments in case I can convert those as well...
* Possibly another int 256 for some sort of 'strict'/blind mode where $cmd is just spawned if the .exe can be found?

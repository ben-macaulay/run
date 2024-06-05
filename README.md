# Run

**What and why**

Run.exe is a silly tool for overcomplicated environments (where an App-V package contains files that aren't used in the launching process, and the native shortcut cannot be published).

Consider an App-V 'bubble' for an ActiveX control, or a launch script that resides on a network share, for example.

Instead of figuring out which App-V bubble to launch the desired process within, Run.exe is added to each application install during sequencing.  Then launching the embedded Run.exe causes the App-V client to use that bubble for the resultant IE11 window or whatever the package is for...  This is done by altering the shortcut details to target to Run.exe instead of the normal target (yes, it's just a shitty wrapper).

**How**

The automated application sequencing script creates a GUID directory for the PVAD and copies Run.exe into this as part of the installation.

The assumption is that the App-V entrypoints are suppressed in the deployment configuration .XML files (or if published, then they're altered) and instead published shortcuts are used via Citrix...

**Usage:**
```
    Run.exe [Int] [Command] [Argument] [WkDir]
    Run.ps1 -int:[Int] -cmd:[Command] -arguments:[Arguments] -wkdir:[Path]
    Run.exe -i:[Int] -c:[Command] -a:["Arguments parameters/files", etc. (in a single string)] -w:[Working directory]
```
It is assumed that Int is the first argument and needs to be a number.  If in doubt, use ```Run.exe 0 "{Command}"``` or qualify them with ```-Int:|-i:``` and ````-Cmd:|-c:```` and optionally ````-Arguments:|-a:````, ````-WkDir:|-w:````

Non-existent .EXE commands will error with an invalid path/file not found.

You can either use the full colon, or spaces, such as: ````Run.exe -i 1024 -c notepad.exe````\
is the same as ````Run.exe -i:1024 -c:notepad.exe````\
as well as ````Run.exe 1024 notepad.exe````

Once the command has been started, a system try icon/cog appears which can be used to present the Int and Command interpretations - unfortunately this happens after the debug prompt if using int=1024.

# 

**Int options**

Add ```-Int``` options below for combinations as required.  Some conflict, testing is required...  Examples are further below.

Possible Int values are various combinations of:
 - **+1**: Systray icon off (Systray icon is on by default, unless using #1 or #32)
 - **+2**: Run [Command] in a hidden window
 - **+4**: Run [Command] in a minimised window (not everything actually supports/honours this)
 - **+8**: Run [Command] in a maximised window
 - **+16**: Convert [Command] so it uses 8.3 paths - This only applies to the command and won't convert 'argument' paths to 8.3.  Supply the full path: C:\Program Files\Internet Explorer\Iexplore.exe - This feature relies on the script finding the .EXE in [Command] and then asking the OS for it's 8.3-equivalent path!  Semi-experimental.
 - **+32**: Wait for [Command] to complete (by default, Run waits for 5 seconds before exiting).  This disables systray as per +1.
 - **+64**: Semi-experimental 64-bit support (Run.exe is compiled as 32-bit by default). Launch [Command] using $Env:Windir\Sysnative (via WoW64 redirection) - you'll need to pass something like reg.exe for it to 'hit' the x64 binaries.  Only works for System32 paths and WILL NOT convert an argument/parameter to x64 path - It's basically just hijacking C:\Windows\SysNative.
 - **+128**: Run [Command] 'strictly' - this avoids the legacy handling for single-parameter commands, where the script would seek to guess the arguments supplied.  This is implied if it receives -Arguments and or -WkDir, but included for 'simple' -Cmd situations.
 - **+256**: Run [Command] in a the default browser (supplies a URL to the users preferred http handler).
 - **+1024**: Display a debug message prior to launching [Command].  Useful if using #1 or #32 (or don't have a taskbar?)

It's assumed the greatest Int you could want is 1257: Debug + Strict + 64-bit + Wait + Maximised + No tray icon
#

A note about ```[cmd]``` getting complicated:

As of v3.4+, use the shortened parameters , -c & -a happily (or add +128/strict) - it's far more reliable! At least provide the ````-c:"{blah}"```` parameter means the script can focus on the real work.  For example, clearly delineate the command and arguments in separate parameters (and the arguments are a SINGLE string):
````
Run.exe 0 reg.exe "export ""HKLM\Software\ODBC\ODBC.INI"" C:\!data\ODBCs.Backup.reg /y"

Run.exe -i 0 -c reg.exe -a "export ""HKLM\Software\ODBC\ODBC.INI"" C:\!data\ODBCs.Backup.reg /y"
````

Alternatively, this will work terribly:

````Run.exe 0 reg.exe export "HKLM\Software\ODBC\ODBC.INI" C:\!data\ODBCs.Backup.reg /y````

- It'll interpret it as the -Arguments being ````export````, the -WkDir as ````C:\!data\ODBCs.Backup.reg```` and have no idea what to do with ````/y````


Another example - Still not perfect and you may need to remember quotes around your URL / Path. If your path has spaces, you may need to duplicate your quotes, E.g:
```
Run.exe 0 MSACCESS.EXE "{UNCPath\File.mde}"

Run.exe 0 "MSACCESS.EXE ""{UNCPath\File.mde}"""
```
Of course, this is problematic (at best) and behaves differently if calling the .PS1 as opposed to the .EXE.  It is assumed that you are using the .EXE henceforth...

Another approach when quotes get complicated is to not qualify the parameter names, so the 0 is for the Integer and the rest is passed throug as one big mess.  The script uses the arguments parameter and 'tacks these on' the end BUT this is only done when the parameters are not explicitly supplied (it uses some old code from runv2 which tries to figure out 'what to do', on the parameter order - this is most likely broken by supplying either the Working directory parameter or Arguments):
```
powershell.exe -exec bypass -f "%~dp0run.ps1" 0 notepad.exe "F:\Complicated\unnecessarily long\path\file name.txt"
```
This is occasionally successful, but I would'nt be surprised if an unintended limitation exists, somewhere...  It really only works for the third parameter.

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
powershell.exe -exec bypass -f "%~dp0run.ps1" -int:0 -cmd:notepad.EXE -arguments:"F:\Complicated\unnecessarily long\path\file name.txt"

powershell.exe -exec bypass -f "%~dp0run.ps1" 0 notepad.exe "F:\Complicated\unnecessarily long\path\file name.txt"
"%~dp0run.exe" 0 "notepad.EXE ""F:\Complicated\unnecessarily long\path\file name.txt"""

"%~dp0run.exe" -int:0 -cmd:"notepad.EXE ""F:\Complicated\unnecessarily long\path\file name.txt"""
```
A browser-based example:
```
run.exe 256 http://stupid.intranet.url/legacypath
```

~~I've extended the parameter handling so that the script passes third and fourth parameters to [Cmd], assuming it's something quirky like a rundll32.exe call or something awful like javaw.exe -jar [file] -Xms1024M -Xmx4096M, etc.~~

I _have_ found that this works well **IF** the cmd and args are in separate parameters: 
  ```
  run.exe 1088 "cmd.exe" "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""...
  run.exe 1024 cmd.exe "/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
  run.exe 1024 cmd.exe -a"/k reg.exe query ""HKLM\software\Microsoft\Windows NT\CurrentVersion"""
  ```
#
## Non-sensical combinations
There isn't a lot of constraint around what parameters combinations can be used:\
WoW64 / x64 processes: Still somewhat experimental\
8.3 paths (on the -Cmd parameter) are handled but obviously these don't make any sense with a browser or 64-bit process...\
Minimising and Maximising windows - also half the time these are intentionally ignored by the child process

Think about it and test some scenarios.

#
## DONE 
* Re-work arguments so it's easier to distinguish between command and parameters - guessing is bad
* Added optional parameter for working directory
* Determine the current directory from run.exe location if not supplied
* Move wow64 support out of legacy branch (where the guessing happens). 
* Added another int 256 to accommodate 'strict' mode (this has bumped the browser feature up to 256, 128=strict).  largely a moot point with better param handling now but I wanted a way to prevent it from 'guessing' if -Cmd had nested parameters that needed to be converted into -Arguments.  The int value 128 changing from browser to strict is because it's assumed browser is never used with other ints (if at all!), whereas strict may be needed in tandem with a handful of others.
#
## TODO
I plan to:
* write a betterexplanation about how the script subtracts from Int according to the features that are consumed.  They're additive which can lead to some confusion and will unreliably accommodate crazy scenarios (minimised and maximised / hidden windows, for example).


I would like to incorporate but simply may not get around to: 
* Make Int not a number with the validation so that if it's not supplied we accommodate sloppy usage (with only a Cmd supplied).  Could be done by setting ````$Cmd = $Int; $Int = 0```` .  Not sure if it's worth it?
* LOW: have another attempt at the 8.3 support and look for periods in the arguments in case I can convert those as well...
* LOW: see if I can resolve the conflict between 'wait' and the icon (and the timers in this GUI mess)
* LOW: build in native support for finding and accepting %tmp% and other environment variables? (this is an issue from the Run command, for example - not sure how the Citrix publishing is affected)
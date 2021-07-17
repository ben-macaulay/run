Param (
    [Parameter (ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true, Position=0)][ValidateRange(0,1151)][int]$Int = 0,
    [Parameter (ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true, Position=1)][string]$Cmd = "cmd.exe"
    )



if ( Test-Path variable:\psEditor ) {  # testing hacks - VSCode:
    $Current_File = $psEditor.GetEditorContext().CurrentFile.Path
    $Current_Folder = (Get-Item $Current_File).Directory.FullName
    $int = 16
    $cmd = """C:\Program Files (x86)\Internet Explorer\iexplore.exe"" http://google.com"
} elseif (Test-Path variable:\psISE ) {  # testing hacks - ISE:
    $Current_File = Split-Path $psise.CurrentFile.FullPath
    $Current_Folder = (Get-Item $Current_File).Directory.FullName
} else {
    $Current_Folder = split-path $MyInvocation.MyCommand.Path
    $Current_File = ([io.fileinfo]$MyInvocation.MyCommand.Definition).Name
}


$msg = "$Current_File`n`nReceived command: `n  `'$Cmd`'`n`nParameters:`n"
if ( $Int -ge 1024 ) { $debug = $true;    $Int = $Int - 1024; $msg = $msg+" - 1024: DEBUG on `n"}
if ( $Int -ge 64 )   { $browser = $true;  $Int = $Int - 64;   $msg = $msg+" -   64: Browser on`n"}
if ( $Int -ge 32 )   { $wait = $true;     $Int = $Int - 32;   $msg = $msg+" -   32: Wait on `n"}
if ( $Int -ge 16 )   { $8dot3 = $true;    $Int = $Int - 16;   $msg = $msg+" -   16: 8.3 support on `n"}
if ( $Int -ge 8 )    { $max = $true;      $Int = $Int - 8;    $msg = $msg+" -    8: Maximised on `n"}
if ( $Int -ge 4 )    { $min = $true;      $Int = $Int - 4;    $msg = $msg+" -    4: Minimised on `n"}
if ( $Int -ge 2 )    { $hide = $true;     $Int = $Int - 2;    $msg = $msg+" -    2: Hidden on `n"}
if ( $Int -ge 1 )    { $iconoff = $true; $Int = $Int - 1;    $msg = $msg+" -    1: Systray icon off (on by default) `n"}
if (test-path Variable:\debug) {$msg = $msg+"Int remainder: $Int"}

1128-64
if ( $browser ) {  # then $cmd is just a URL?
    $httphandler = (Get-ItemProperty registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice -Name ProgId).ProgId
    $httphandler = (Get-ItemProperty registry::HKEY_CLASSES_ROOT\$httphandler\shell\open\command -Name '(default)').'(default)'
    
    $exeends = $httphandler.IndexOf(".exe")+5                           # find the end of the first .exe
    $exeargs = $httphandler.Substring($exeends)                         # everything else goes into the args
    $exeargs = $exeargs.replace('%1',$cmd)                              # strip %1 of course
    $exeargs = $exeargs.Trim()                                          # strip spaces

    $exe = $httphandler.Substring(0,$exeends)                           # Grab just the .EXE path
    $exe = $exe.replace('"','')                                         # strip quotes
    $cmd = $exe+" "+$exeargs                                            # put it all back together...
    $msg = $msg+"`n`nConverted for browser to:`n`'$exe`'`n`'$exeargs`'"
} else {                                                                # Find out if binary exists
    $exeends = $cmd.IndexOf(".exe")+5                                   # find the end of the first .exe
    if ($cmd.Length -gt $exeends) {
        $exeargs = $cmd.Substring($exeends)                             # everything else goes into the args
        $exeargs = $exeargs.Trim()                                      # strip spaces
        $exe = $cmd.Substring(0,$exeends)                               # Grab just the .EXE path
    } else {
        #$exeargs = $false
        $exe = $cmd
    }
    $exe = $exe.replace('"','')                                         # strip quotes
    $exe = $exe.trim()                                                  # blanks
    $msg = $msg+"`n`nConverted to: `'$exe`'`n`Arguments: `'$exeargs`'"
    #if ( test-path $exe ) {"found $exe" }
    #else { write-host $msg; throw "Couldn't find $exe - aborting..." } # No .EXE - no bueno... Meh! Who cares?!
}


if ( $8dot3 ) { # https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/converting-file-paths-to-8-3-part-2

    $regblock = Get-ItemPropertyValue registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem -Name NtfsDisable8dot3NameCreation
    if ( $regblock -ne 1 ) { # technically, the filesystem *could* still have 8.3 disabled, but at least the OS doesn't disallow it system-wide...

        #signature of internal API call:
        $signature = '[DllImport("kernel32.dll", SetLastError=true)] public static extern int GetShortPathName(String pathName, StringBuilder shortName, int cbShortName);'
        # turn signature into .NET type:
        Add-Type -MemberDefinition $signature -Namespace Tools -Name Path -UsingNamespace System.Text
        $sb = [System.Text.StringBuilder]::new(300)                      # create empty string builder with 300-character capacity
        $rv = [Tools.Path]::GetShortPathName($exe, $sb, 300)             # ask Windows to convert long path to short path with a max of 300 characters
        if ($rv -ne 0){
            $exe = $sb.ToString()
            $msg = $msg+"`n`nFurther converted to 8.3:'$exe`'`n`Arguments:'$exeargs`'"
        } else { throw "Errors converting $cmd to 8.3 - Are 8.3 names supported by the filesystem?"}
    } else { throw "8.3 is disabled by regkey NtfsDisable8dot3NameCreation!" }
}


if ( $max -and -not($min -or $hide)) {$ws = "Maximized"}
if ( $min -and -not($max -or $hide)) {$ws = "Minimized"}
if ( $hide -and -not($min -or $max)) {$ws = "Hidden"}
if (test-path Variable:\ws){$msg = $msg+"`n-WindowStyle: '$ws`'"}


if ($debug) {write-host $msg}


# spawn process...  Fsckin finally!
#The systray icon and wait can't really co-exist, so:
if (($true -eq $wait) -and ($true -eq $iconoff)){       # wr're waiting for the child process to close

    if (($ws) -and ($exeargs)) {start-process $exe -ArgumentList $exeargs -WindowStyle $ws -wait}
    elseif ($exeargs) {start-process $exe -ArgumentList $exeargs -wait}
    elseif ($ws) {start-process $exe -WindowStyle $ws -wait}
    else {start-process $exe -wait}

} elseif ($iconoff) {                                    # No systray icon, just launch it!

    if (($ws) -and ($exeargs)) {start-process $exe -ArgumentList $exeargs -WindowStyle $ws}
    elseif ($exeargs) {start-process $exe -ArgumentList $exeargs}
    elseif ($ws) {start-process $exe -WindowStyle $ws}
    else {start-process $exe }

} else {                                                 # make a fancy systray icon...  Big tedious mess of GUI crap:
<# 
    Systray stuff shamelessly stolen from https://www.systanddeploy.com/2018/12/create-your-own-powershell.html
    WinForms stuff shamelessly stolen from:
        https://www.systanddeploy.com/2019/08/modern-dialog-with-powershell-and-wpf.html
        & https://github.com/damienvanrobaeys/Build-PS1-Systray-Tool/tree/master/MySystrayTool
        https://4sysops.com/archives/create-a-gui-for-your-powershell-script-with-wpf/
    Icon shamelessly stolen from Freepik: https://www.flaticon.com/free-icon/cog_313616
      See https://www.freepik.com/
#>

    # Add assemblies for WPF & forms
    [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')    | out-null
    [System.Reflection.Assembly]::LoadWithPartialName('presentationframework')   | out-null
    [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')    | out-null
    [System.Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration') | out-null
    

    # Choose an icon to display in the systray
    $icon = [System.Drawing.Icon]::ExtractAssociatedIcon("$Current_Folder\cog.ico") 

    # Basic forms garbage
    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Current_File
    $form.Size = New-Object System.Drawing.Size(500,350)
    $form.StartPosition = 'CenterScreen'
    $form.add_FormClosing({$timer1.Start()})	# resume timer once the analysis dialog is closed

    # Debug text label
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,20)
    $label.Size = New-Object System.Drawing.Size(500,200)
    $label.Text = $msg
    $form.Controls.Add($label)

    # Add the systray icon 
    $Main_Tool_Icon = New-Object System.Windows.Forms.NotifyIcon
    $Main_Tool_Icon.Text = $Current_File
    $Main_Tool_Icon.Icon = $icon
    $Main_Tool_Icon.Visible = $true
    
    # Add menu users
    $Current_File_analysis = New-Object System.Windows.Forms.MenuItem
    $Current_File_analysis.Text = "$Current_File analysis"
    
    # Add menu exit
    $Menu_Exit = New-Object System.Windows.Forms.MenuItem
    $Menu_Exit.Text = "Exit"
    
    # Add all menus as context menus
    $contextmenu = New-Object System.Windows.Forms.ContextMenu
    $Main_Tool_Icon.ContextMenu = $contextmenu
    $Main_Tool_Icon.contextMenu.MenuItems.AddRange($Current_File_analysis)
    $Main_Tool_Icon.contextMenu.MenuItems.AddRange($Menu_Exit)


    # ---------------------------------------------------------------------
    # Action after clicking on Current_File analysis
    # ---------------------------------------------------------------------
    $Current_File_analysis.Add_Click({
        $timer1.Stop()
        $form.ShowDialog()
    })


    # ---------------------------------------------------------------------
    # Action when after a click on the systray icon
    # ---------------------------------------------------------------------
    $Main_Tool_Icon.Add_Click({					
        # Nasty WPF thingy? https://stackoverflow.com/questions/3870498/is-it-absolutely-safe-to-display-a-wpf-window-from-a-winforms-form/3873048
        # [System.Windows.Forms.Integration.ElementHost]::EnableModelessKeyboardInterop($Users_Window)
        If ($_.Button -eq [Windows.Forms.MouseButtons]::Left) {
            $Users_Window.WindowStartupLocation = "CenterScreen"
            $Users_Window.Show()
            $Users_Window.Activate()	
        }				
    })

    # When Exit is clicked, close everything and kill the PowerShell process
    $Menu_Exit.add_Click({
        $Main_Tool_Icon.Visible = $false
        #$Users_Window.Close()
        Stop-Process $pid
    })

    # Make PowerShell Disappear - Thanks Chrissy
    $windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
    $asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
    $null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0)
    
    # Use a Garbage colection to reduce Memory RAM
    # https://dmitrysotnikov.wordpress.com/2012/02/24/freeing-up-memory-in-powershell-using-garbage-collector/
    # https://docs.microsoft.com/fr-fr/dotnet/api/system.gc.collect?view=netframework-4.7.2
    [System.GC]::Collect()
    
    # timer stolen from https://www.sapien.com/blog/2008/12/18/winforms-and-timers/
    $timer1 = New-Object System.windows.Forms.Timer             # add the timer control
    $timer1.Enabled=$True                                       # enable it
    $interval=10                                                # set the timer interval
    $timer1.Interval = ($interval * 1000)                       # interval is ms
    $timer1.add_Tick({                                          # what to 'do' when timer completes...
        $Main_Tool_Icon.Visible = $false
        Stop-Process $pid
    })
    $timer1.Start()                                             # start the timer


    # spawn process...  Fsckin finally!
    if (($ws) -and ($exeargs)) {start-process $exe -ArgumentList $exeargs -WindowStyle $ws}
    elseif ($exeargs) {start-process $exe -ArgumentList $exeargs}
    elseif ($ws) {start-process $exe -WindowStyle $ws}
    else {start-process $exe }


    # Create an application context for it to all run within - Thanks Chrissy
    # This helps with responsiveness, especially when clicking Exit - Thanks Chrissy
    $appContext = New-Object System.Windows.Forms.ApplicationContext
    [void][System.Windows.Forms.Application]::Run($appContext)

}
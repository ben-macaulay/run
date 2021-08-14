Usage:
    Run.exe [Int] [Command]

Possible Int values are combinations of:
    1: Systray icon off (on by default)
    2: Run [Command] in a hidden window
    4: Run [Command] in a minimised window (not everything actually supports/honours this)
    8: Run [Command] in a maximised window
    16: Convert [Command] so it uses 8.3 paths 
    32: Wait for [Command] to complete (otherwise, waits for 10s before exiting)
    64: Run [Command] in a the default browser (supply a URL)

Don't forget quotes around your URL / Path. If your path has spaces, you may need to duplicate your quotes, E.g:
    Run.exe "MSACCESS.EXE ""{UNCPath\File.mde}"""

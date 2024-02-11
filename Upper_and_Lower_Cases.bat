@echo off
chcp 65001 > nul


setlocal enabledelayedexpansion

    set args=%*

    if not defined args (goto :eof)
    
    set /a upp_qtt=0
    set /a lwr_qtt=0
    
    set has_upp=0
    set has_lwr=0


    :Start
    if "%args:~0,1%" neq " " (

        echo %args:~0,1% | findstr /r [ABCDEFGHIJKLMNOPQRSTUVWXYZ] > nul

        if !errorlevel! equ 0 (
            set /a upp_qtt+=1
            set has_upp=1
        )

        echo %args:~0,1% | findstr /r [abcdefghijklmnopqrstuvwxyz] > nul

        if !errorlevel! equ 0 (
            set /a lwr_qtt+=1
            set has_lwr=1
        )
    )

    set args=%args:~1%

    if "%args%" neq "" (goto :Start)

    set "content=no Alphabetic Characters :"

    if "!has_upp!!has_lwr!" equ "01" (set "content=Just Lower Cases :")
    if "!has_upp!!has_lwr!" equ "10" (set "content=Just Upper Cases :")
    if "!has_upp!!has_lwr!" equ "11" (set "content=Upper and Lower Cases :")

    :End
    echo.
    echo The String has !content! & echo.
    echo ^• Number of Uppercase Letters ^: !upp_qtt!
    echo ^• Number of Lowercase Letters ^: !lwr_qtt!

endlocal

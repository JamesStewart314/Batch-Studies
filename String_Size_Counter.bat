@echo off
chcp 65001 > nul

:: This Program Counts How Many Characters a String Has
setlocal enabledelayedexpansion

    REM Capturing Arguments :
    set argv=%*

    if not defined counter (set /a counter=0)
    if not defined spaces (set /a spaces=0)

    :Main
    
    if "!argv:~%counter%, 1!" equ " " (set /a spaces+=1)
    if not "!argv:~%counter%, 1!" equ "" (set /a counter+=1 & goto :Main)

    set /a letters_number=!counter! - !spaces!

    echo. & REM Line Spacing
    echo Letters Number = !letters_number!
    
    REM If the String Has Spaces :
    if "!spaces!" neq "0" (
        echo Spaces Number = !spaces!
        echo String Total Size = !counter!
    )

endlocal

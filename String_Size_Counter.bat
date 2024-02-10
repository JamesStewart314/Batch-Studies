::
::         This code analyzes a string, determining the number of spaces and total string size
::
:: Usage Example: ' cmd /c "C:\Users\MyUser\Downloads\String_Size_Counter.bat" this is a example of string    to perform  the test '
::                          /^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\
::                        | Hypothetical Path of this Program on your Computer |
::

@echo off
chcp 65001 > nul

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

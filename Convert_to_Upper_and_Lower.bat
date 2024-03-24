::
::                           This code converts all characters in a string to uppercase or lowercase
::                                          and prints the result to the terminal.
::
::  Usage Example: cmd /c "C:\Users\MyUser\Downloads\Convert_to_Upper_and_Lower.bat" THis iS a EXaMplE of STring  to PERFORM  the TEST.
::                         /^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\
::                        |   Hypothetical Path of this Program on your Computer   |
::

@echo off
chcp 65001 > nul

setlocal enabledelayedexpansion

    set "lowerCase=abcdefghijklmnopqrstuvwxyz"
    set "upperCase=ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    set userString=%*

    if not defined counter (set /a "counter=1")

    :askConversion
    set /p "conversionType=[33mWanna Convert the Given String to [u]pper or [l]ower?[0m "

    if /I "l" equ "!conversionType!" (
        goto :ConvertToLower
    ) else if /I "u" equ "!conversionType!" (
        goto :ConvertToUpper
    ) else (
        echo.
        echo Invalid Choice^^!
        echo Press Any Key to Try Again.
        pause > nul & goto :askConversion
    )

    :EndProgram
    echo. & echo • [32mString Converted[0m: !userString!
    goto :eof

    :ConvertToLower
    set upperLetter=!upperCase:~-%counter%, 1!
    set lowerLetter=!lowerCase:~-%counter%, 1!

    set userString=!userString:%upperLetter%=%lowerLetter%!

    set /a counter=!counter! + 1

    if !counter! gtr 26 (goto :EndProgram)

    goto :ConvertToLower

    :ConvertToUpper
    set upperLetter=!upperCase:~-%counter%, 1!
    set lowerLetter=!lowerCase:~-%counter%, 1!

    set userString=!userString:%lowerLetter%=%upperLetter%!

    set /a counter=!counter! + 1

    if !counter! gtr 26 (goto :EndProgram)

    goto :ConvertToUpper

endlocal

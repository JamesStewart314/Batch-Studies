::
::  This code checks if a positive integer is prime and displays the result in the terminal.
::
::          Usage Example: cmd /c "C:\Users\MyUser\Downloads\Is_Prime.bat" 27
::                                /^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\
::                       |   Hypothetical Path of this Program on your Computer   |
::

@echo off
chcp 65001 > nul

setlocal enabledelayedexpansion

    set number=%1

    set /a remainder=!number!%%2

    if !remainder! equ 0 (echo • [31mIt's not Prime[0m & goto :eof)

    set /a limit=!number!-2
    for /l %%a in (3, 2, !limit!) do (
        set /a remainder=!number!%%%%a
        if !remainder! equ 0 (
            echo • [31mIt's not Prime[0m & goto :eof
        )
    )

    echo • [32mIs Prime[0m & goto :eof

endlocal

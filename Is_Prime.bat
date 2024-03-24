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

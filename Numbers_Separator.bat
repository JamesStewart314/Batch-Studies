@echo off

setlocal enabledelayedexpansion

    for /l %%a in (1, 1, %1) do (call :sep %%a)

    echo.
    echo %odd%
    echo %even%

    goto :eof

    :sep
    set /a result=%1 %% 2  & REM Evaluate the Remainder of 2

    if !result! equ 0 (
        if defined even (
            set even=!even!, %1
        ) else (
            set even=%1
        )

    ) else (if defined odd (
            set odd=!odd!, %1
        ) else (
            set odd=%1
        )
    )

endlocal

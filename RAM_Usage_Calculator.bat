::
:: This simple program performs an analysis of the Windows task list and 
:: reports the total RAM consumption at the last moment the record was performed.
:: 

@echo off
chcp 65001 > nul

setlocal enabledelayedexpansion

    :Main
    title RAM Monitor - %time:~0,-3%
    
    set /a total_ram_usage=0

    tasklist 1> "%tmp%\ram_data.tmp"

    echo Calculating RAM...

    for /f "tokens=5 usebackq" %%a in ("%tmp%\ram_data.tmp") do (call :sum_func %%a)

    echo.    
    echo Current Total Ram Usage: %total_ram_usage%
    pause > nul
    goto :eof

    :sum_func
    title RAM Monitor - %time:~0,-3%

    echo %1 | find "." > nul

    set value=%1
    set value=%value:.=%

    if %errorlevel% == 0 (
        if "!value!" neq ".=" (
            set /a total_ram_usage+=!value! > nul
        )
    )

endlocal

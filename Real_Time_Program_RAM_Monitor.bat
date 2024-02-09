::
:: This code performs an analysis of the real-time RAM
:: consumption of a program open on the computer.
:: 

@echo off
chcp 65001 > nul
color 0A

setlocal enabledelayedexpansion

    :Main
    title RAM Monitor - %time:~0,-3%

    echo.
    echo Enter a Full Process Imagename (Ex.: chrome.exe) :
    set /p "program_imagename=>>> "

    tasklist | find /i "%program_imagename%" > nul

    if %errorlevel% equ 1 (
        echo.
        echo There is no Current Process with this Imagename
        echo Press Enter to Continue...
        pause > nul
        cls & goto :Main
    )

    :Eval_Ram
    tasklist | find /i "%program_imagename%" 1> "%tmp%\ram_program_data.tmp"

    if %errorlevel% equ 1 (
        cls
        echo Program Closed...
        timeout /nobreak /t 2 > nul
        goto :Eval_Ram
    )

    set /a total_ram_usage=0
    for /f "tokens=5 usebackq" %%a in ("%tmp%\ram_program_data.tmp") do (call :sum_func %%a)
 
    goto :Display_RAM

    :sum_func
    title RAM Monitor - %time:~0,-3%

    echo %1 | find "." > nul

    set value=%1
    set value=!value:.=!

    if !errorlevel! == 0 (
        if not "!value!" == ".=" (
            set /a total_ram_usage+=!value! > nul
        )
    )
    goto :eof

    :Display_RAM
    set /a number_size=0

    :loop
    if "!total_ram_usage:~%number_size%, 1!" neq "" (set /a number_size+=1 & goto :loop)

    timeout /nobreak /t 1 > nul & REM sleep of 1 sec

    if !number_size! geq 7 (if !number_size! leq 9 (goto :GB))
    if !number_size! geq 4 (if !number_size! leq 6 (goto :MB))
    if !number_size! geq 1 (if !number_size! leq 3 (goto :KB))

    :GB
    cls & echo.
    set /a gb_memory=!total_ram_usage!/(1024*1024)
    echo Ram Usage of !program_imagename! in Real Time : !gb_memory!,!total_ram_usage:~1, 2! Gb
    echo (Press CTRL ^+ C to End the Program...)
    goto :Eval_Ram

    :MB
    cls & echo.
    echo !total_ram_usage!
    set /a mb_memory=!total_ram_usage!/1024
    echo Ram Usage of !program_imagename! in Real Time : !mb_memory!,!total_ram_usage:~-3, -1! Mb
    echo (Press CTRL ^+ C to End the Program...)
    goto :Eval_Ram

    :KB
    cls & echo.
    echo Ram Usage of !program_imagename! in Real Time : !total_ram_usage! Kb
    echo (Press CTRL ^+ C to End the Program...)
    goto :Eval_Ram

endlocal

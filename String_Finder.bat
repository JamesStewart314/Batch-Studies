::
::                                                      !!! ATTENTION !!!
::          Despite being a general terminal script, this code was designed to run specifically on the Windows conhost.
::
::                     You can open it directly through cmd.exe or Windows Powershell with the help of the 
::                          command ' conhost "C:\Users\MyUser\Desktop\MyFolder\String_Search.bat" '.
::                                            //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\\
::                                          | Hypothetical path of this .bat file on your computer |
::
::
::    After opening the program correctly, type in double quotes the root path where you search for the desired string pattern
::     must be searched (e.g.: ' "C:\Users\MyUser\some_random_folder" ') and the target string pattern itself, respectively.
::

@echo off
chcp 65001 > nul
title String Finder
mode con: lines=20 cols=50

setlocal enabledelayedexpansion

    if exist "%temp%\String_Search_Info.txt" (del /f /q "%temp%\String_Search_Info.txt")
    if exist "%temp%\String_Search_Result.txt" (del /f /q "%temp%\String_Search_Result.txt")
    if exist "%temp%\String_Search_Lines.txt" (del /f /q "%temp%\String_Search_Lines.txt")

    set /a occurrences=0
    echo What Path the Search Should Start^?
    set /p "search_local=>>> "
    echo Input the Desired String to Search
    set /p "desired_string_pattern= >>> "

    title Searching . . .

    for /l %%a in (50, 2, 100) do (mode con: lines=20 cols=%%a)

    echo ^• Final Search Result ^: >> "%temp%\String_Search_Result.txt" & echo. >> "%temp%\String_Search_Result.txt"

    for /r %search_local% %%a in (*.txt *.py *.pyw *.c *.cpp *.java *.bat) do (
        find /n /i "%desired_string_pattern%" "%%a" 1> "%temp%\String_Search_Info.txt"
        call :Verify
    )

    echo. >> "%temp%\String_Search_Result.txt" & echo. >> "%temp%\String_Search_Result.txt"
    echo ^• Matching Results in !occurrences! Different Files Were Found^! >> "%temp%\String_Search_Result.txt"

    :Window
    findstr /n "^" "%temp%\String_Search_Result.txt" | find /c ":" > "%temp%\String_Search_Lines.txt"
    set /p number_lines=< "%temp%\String_Search_Lines.txt"
    set /a number_lines=%number_lines%+3

    if %number_lines% geq 100 (
        if %number_lines% leq 200 (
            for /l %%n in (100, 1, %number_lines%) do (mode con: lines=%%n)
        ) else (
            for /l %%n in (100, 1, 200) do (mode con: lines=%%n)
        )
        
    ) else (
        if  %number_lines% geq 50 (
            for /l %%n in (100, -1, %number_lines%) do (mode con: lines=%%n)
            ) else (
                mode con: lines=40
            )
    )

    :Result
    cls
    type "%temp%\String_Search_Result.txt" | more
    timeout /nobreak -1

    :Verify
    find /i "[" "%temp%\String_Search_Info.txt" 1> nul

    if %errorlevel% equ 0 (
        type "%temp%\String_Search_Info.txt" >> "%temp%\String_Search_Result.txt"
        set /a occurrences+=1
    )

endlocal

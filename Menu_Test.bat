@echo off & cls
color a

title Menu - Test

:menu
cls
echo  _ __ ___   ___ _ __  _   _
echo ^| '_ ` _ \ / _ \ '_ \^| ^| ^| ^|
echo ^| ^| ^| ^| ^| ^|  __/ ^| ^| ^| ^|_^| ^|
echo ^|_^| ^|_^| ^|_^|\___^|_^| ^|_^|\__,_^| 
echo.
echo 1) - Calculator
echo 2) - Task Manager
echo 3) - Explorer
echo 4) - Notepad
echo 5) - Close Menu

echo.
choice /c "12345" /n /m "Select an Option >> "

:decision
goto %errorlevel%

:1
start calc.exe
goto menu

:2 
start taskmgr.exe
goto menu

:3
start explorer.exe
goto menu

:4
start notepad.exe
goto menu

:5
echo. & echo Thanks for Using this Menu! Press any key to close...
pause >nul
color & cls

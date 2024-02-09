::
:: This code separates the even and odd numbers in a given range
::
:: Usage Example: cmd /c "C:\Users\MyUser\Downloads\Numbers_Separator.bat" this is a example of string    to perform  the test
::                          /^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\
::                         Hypothetical Path of this Program on your Computer
::

@echo off

set /a num=0
set /a letter=0
set args=%*

if not defined args (echo No Valid Args & goto :eof)

for %%a in (%args%) do (set temp_param=%%a & call :Start)

:End
echo.
echo Characters: %letter%
echo Numbers: %num%
echo.

if "%letter%" equ "0" (
    if "%num%" equ "0" (echo Type: Empty String) else (echo Type: Numeric String)
    ) else (if "%num%" equ "0" (echo Type: Alphabetic String) else (echo Type: Alphanumeric String))


goto :eof

:Start
set current_char=%temp_param:~0,1%
if "%current_char%" equ "0" (set /a num+=1 & set temp_param=%temp_param:~1% & goto :Start)

if "%current_char%" equ " " goto :eof

set /a current_char_num=%current_char%
if %current_char_num% equ 0 (set /a letter+=1) else (set /a num+=1)

set temp_param=%temp_param:~1%

if "%temp_param%" equ " " goto :eof
goto :Start

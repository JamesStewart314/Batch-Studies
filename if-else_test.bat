@echo off
chcp 65001 > nul

REM Program to test conditional structures


cls & title If-Else Test Program

set /p "answer_1=what is 2 + 2 = "

if %answer_1% equ 4 (
    echo Correct!!!
) else (
    echo Wrong Answer...
)

echo.
set /p "answer_2=what cows drink? >>> "

if /I "%answer_2%" equ "water" (
    echo Nice ;^)
) else (
    echo Sorry, wrong...
)

echo.
echo Checking if chrome is open...
tasklist /FI "imagename eq chrome.exe" | find "chrome.exe" > nul

if %errorlevel% == 0 (echo Chrome is Open!) else (echo Chrome is not Open!)

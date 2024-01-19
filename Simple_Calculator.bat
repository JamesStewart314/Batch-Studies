@echo off

:: A simple calculator code to practice batch programming.

title Calculator - %time:~0,-4%
cls
color a

set /p value_1="Enter an Integer Value : "
set /p operator="Choose an Operator (+, -, *, /, %%) : "
set /p value_2="Enter Another Integer Value : "
set /a result=%value_1% %operator% %value_2%

:: Clean the Screen :
cls

echo Result:
echo. & echo    %value_1% %operator% %value_2% = %result%
echo. & echo Press Any Key to Continue...
pause >nul
color
cls

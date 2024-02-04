@echo off
chcp 65001 > nul

title Flux Control Test

::uncomment the next line and put the path of the program folder
::cd <paste the path here>

set /p "program=Input the Program name (with extension) to see the Info> "

call :prop %program%

:prop
echo FILE PROPERTIES (%~nx1) :
echo Name: %~n1
echo Extension: %~x1
echo Size: %~z1
::echo Path: %~f1
echo Path: %~dpnx1
pause > nul

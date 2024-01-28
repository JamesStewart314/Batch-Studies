@echo off
chcp 65001 > nul


if exist myconfig.bat (call myconfig.bat) else (goto :makeconfig)

color %bg_color%%letter_color% & title %title%

:makeconfig
echo PROPERTIES PANEL:
echo.

call :colors
echo.

set /p "letter_color=Input a digit from 0 to 9 to be the letter color> "
echo.
set /p "bg_color=Input a digit from 0 to 9 to be the background color> "
echo.
set /p "title=Input a title to the Window> "


REM Saving The File:

(

    echo set letter_color=%letter_color%
    echo set bg_color=%bg_color%
    echo set title=%title%

) > myconfig.bat

echo.
echo Open this file again to see the results^! Press any key to continue...
pause > nul

goto :eof

:colors
echo    0 = Black        8 = Gray
echo    1 = Blue         9 = Light Blue
echo    2 = Green        A = Light Green
echo    3 = Aqua         B = Light Aqua
echo    4 = Red          C = Light Red
echo    5 = Purple       D = Lilac
echo    6 = Yellow       E = Light Yellow
echo    7 = White        F = Bright White

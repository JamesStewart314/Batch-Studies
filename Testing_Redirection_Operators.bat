@echo off

cls & title Testing Redirection Operators

:: Creating the File :
>test.txt echo Firts
:: Appending :
>>test.txt echo Test

:: Testing STDIN and STDOUT w/ Redirection Operators
systeminfo > system_info.txt
sort 0< system_info.txt > ordered_system_info.txt

:: Transferring Content from a File to a Variable
echo This is a Sample Text > txt.txt
set /p var=<txt.txt
echo %var%

:: Printing in Same Line :
set /p t1=Text < nul
set /p t1=in < nul
set /p t1=One < nul
set /p t1=Line < nul

:: Network Info :
ipconfig /all 1>> info_tcp-ip.txt 2>&1
arp /a 1>> net_info.txt & netstat /a 1>> net_info.txt

pause > nul

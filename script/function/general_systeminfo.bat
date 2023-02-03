echo off
cls
systeminfo > %site%data\temp\systeminfo.txt
start %site%expandtools\Notepad2.exe %site%data\temp\systeminfo.txt
exit
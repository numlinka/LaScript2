echo off
cls
netsh wlan show profiles name=* key=clear > %site%data\temp\netsh.txt
start %site%expandtools\Notepad2.exe %site%data\temp\netsh.txt
exit
mode con cols=60 lines=15
@echo off
set site="%~dp0"
cd /d %site%
::mode con cols=120 lines=30
title SHA1
::Setlocal Enabledelayedexpansion
set var=----------------------------------------
:main
cls
set file=""
echo. & echo   ��һ�����: [ %var% ]
echo. & echo   [ SHA1 ] �ļ���ַ: & echo.
set /p file=^>^>^>
if %file%=="" goto reset
certutil -hashfile %file% >%temp%\SHA1.txt

::start notepad %temp%\SHA1.txt

::for /f "delims=" %%i in (%temp%\SHA1.txt) do (
::set /a n+=1 & if !n!==2 set "var=%%i")

more +1 %temp%\SHA1.txt>%temp%\SHA1.txt.tmp
set /p var=<%temp%\SHA1.txt.tmp
del /q %temp%\SHA1.txt.tmp

echo %var%|clip
del /f /q %temp%\SHA1.txt
goto main

:reset
set var=----------------------------------------
goto main
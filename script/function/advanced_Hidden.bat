echo off
:advanced_Hidden
cls
echo.
echo   [] 显示隐藏文件
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden | findstr /r /i "0x1" >nul && echo     ·1.显示隐藏文件            是
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden | findstr /r /i "0x0" >nul && echo     ·1.显示隐藏文件          否
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | findstr /r /i "0x0" >nul && echo     ·2.显示文件拓展名          是
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | findstr /r /i "0x1" >nul && echo     ·2.显示文件拓展名        否
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden | findstr /r /i "0x1" >nul && echo     ·3.显示超级隐藏文件        是
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden | findstr /r /i "0x0" >nul && echo     ·3.显示高级隐藏文件      否
echo.
echo     ·0.恢复至系统默认
echo.
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 goto start_1
if %ERRORLEVEL%==2 goto satrt_2
if %ERRORLEVEL%==3 goto satrt_3
if %ERRORLEVEL%==10 goto satrt_0
if %ERRORLEVEL%==14 %site%script\main\main_advanced.bat
goto advanced_Hidden

:satrt_0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t reg_dword /d 0 /f
goto advanced_Hidden

:start_1
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden | findstr /r /i "0x1" && reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t reg_dword /d 0 /f && goto advanced_Hidden
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden | findstr /r /i "0x0" && reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t reg_dword /d 1 /f && goto advanced_Hidden
goto advanced_Hidden

:satrt_2
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | findstr /r /i "0x1" && reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t reg_dword /d 0 /f && goto advanced_Hidden
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | findstr /r /i "0x0" && reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t reg_dword /d 1 /f && goto advanced_Hidden
goto advanced_Hidden

:satrt_3
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden | findstr /r /i "0x1" && reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t reg_dword /d 0 /f && goto advanced_Hidden
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden | findstr /r /i "0x0" && reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t reg_dword /d 1 /f && goto advanced_Hidden
goto advanced_Hidden
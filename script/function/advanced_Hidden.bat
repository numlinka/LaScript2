echo off
:advanced_Hidden
cls
echo.
echo   [] ��ʾ�����ļ�
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden | findstr /r /i "0x1" >nul && echo     ��1.��ʾ�����ļ�            ��
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden | findstr /r /i "0x0" >nul && echo     ��1.��ʾ�����ļ�          ��
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | findstr /r /i "0x0" >nul && echo     ��2.��ʾ�ļ���չ��          ��
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | findstr /r /i "0x1" >nul && echo     ��2.��ʾ�ļ���չ��        ��
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden | findstr /r /i "0x1" >nul && echo     ��3.��ʾ���������ļ�        ��
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden | findstr /r /i "0x0" >nul && echo     ��3.��ʾ�߼������ļ�      ��
echo.
echo     ��0.�ָ���ϵͳĬ��
echo.
echo     ��X.����
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
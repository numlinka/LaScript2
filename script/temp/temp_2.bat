:temp_2
cls
echo.
echo   [] ���������� ����������
echo.
echo     ��1.����
echo     ��2.���
echo     ��3.webapp
echo.
echo     ��9.all
echo.
echo     ��0.�ر� ����������
echo.
if %A_rights%==false echo     ��A.��ȡ����ԱȨ�� & echo.
echo     ��X.����
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 del /f /s /q %SystemDrive%\Users\%username%\AppData\Local\Netease\CloudMusic\Cache\*.*
if %ERRORLEVEL%==2 del /f /s /q %SystemDrive%\Users\%username%\AppData\Local\Netease\CloudMusic\Temp\*.*
if %ERRORLEVEL%==3 del /f /s /q %SystemDrive%\Users\%username%\AppData\Local\Netease\CloudMusic\webdata\*.*
if %ERRORLEVEL%==9 del /f /s /q %SystemDrive%\Users\%username%\AppData\Local\Netease\CloudMusic\*.*
if %ERRORLEVEL%==10 taskkill /t /f /im "cloudmusic.exe"
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo main_temp >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\temp\main_temp.bat
goto temp_2
:power_options
cls
echo.
echo   [] 电源选项
echo.
echo     ·1.休眠
echo     ·2.关机
echo     ·3.重启
echo     ·4.转到高级启动选项菜单
echo.
if %A_rights%==false echo  [*]·5.宕机
if %A_rights%==true echo     ·5.宕机
if %A_rights%==false ( echo. & echo     ·A.获取 管理员 权限 )
echo.
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m "Shutdown>"
if %ERRORLEVEL%==1 shutdown /h /t 0
if %ERRORLEVEL%==2 shutdown /s /t 0
if %ERRORLEVEL%==3 shutdown /r /t 0
if %ERRORLEVEL%==4 shutdown /r /o /t 0
if %A_rights%==true if %ERRORLEVEL%==5 taskkill /fi "pid ge 1" /f
if %ERRORLEVEL%==11 (
	echo power_options >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto power_options
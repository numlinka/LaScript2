:main_temp
cls
echo.
echo   [] Test Function
echo.
echo     ·1.上网搜索
echo     ·2.NetEase Cloud Music Tool
echo     ·3.VMware Player 与 Device/Credential Guard 不兼容
echo.
if %A_rights%==false echo     ·A.获取管理员权限
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 %site%script\temp\temp_1.bat
if %ERRORLEVEL%==2 %site%script\temp\temp_2.bat
if %ERRORLEVEL%==3 bcdedit /set hypervisorlaunchtype off
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo main_temp >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto main_temp
:main_security
cls
echo.
echo   [] 系统安全
echo.

if %A_rights%==true (
	echo     ·1.关闭 135.137.138.139.445 端口
	)
if %A_rights%==false (
	echo  [*]·1.关闭 135.137.138.139.445 端口
	)
echo.
if %A_rights%==false echo     ·A.获取管理员权限
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %A_rights%==false if %ERRORLEVEL%==1 goto error_a
if %A_rights%==true if %ERRORLEVEL%==1 %site%script\function\security_closeport_st.bat
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo main_security >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto main_security

:error_a
if %function_autogeta%==true (
	echo main_security >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
mshta vbscript:msgbox("请先获取管理员权限，再使用这个功能",64,"LaSctip：提醒")(window.close)
goto main_security
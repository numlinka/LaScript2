:main_general
cls
echo.
echo   [] 常规功能
echo.
if %A_rights%==true (
	echo     ·1.清理系统缓存
	echo     ·2.修复"ITM已禁用"
	echo     ·3.检查磁盘
	echo     ·4.修复损坏的系统文件
	echo     ·5.显示本地操作系统的配置信息
	echo     ·6.在桌面创建控制台文件夹
	echo     ·7.初始化网络环境
	echo     ·8.查看本机 WLAN 接口所有配置文件的详情信息
	)
if %A_rights%==false (
	echo     ·1.清理系统缓存
	echo  [*]·2.修复"ITM已禁用"
	echo  [*]·3.检查磁盘
	echo  [*]·4.修复损坏的系统文件
	echo     ·5.显示本地操作系统的配置信息
	echo     ·6.在桌面创建控制台文件夹
	echo  [*]·7.初始化网络环境
	echo     ·8.查看本机 WLAN 接口所有配置文件的详情信息
	)
echo.
if %A_rights%==false echo     ·A.获取管理员权限
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 %site%script\function\general_delsystemp.bat
if %ERRORLEVEL%==5 start "systeminfo" %site%\script\function\general_systeminfo.bat
if %ERRORLEVEL%==6 md "%site_desktop%GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
if %ERRORLEVEL%==8 start "netsh" %site%\script\function\general_netsh.bat
if %A_rights%==false if %ERRORLEVEL%==2 goto error_a
if %A_rights%==false if %ERRORLEVEL%==3 goto error_a
if %A_rights%==false if %ERRORLEVEL%==4 goto error_a
if %A_rights%==false if %ERRORLEVEL%==7 goto error_a
if %A_rights%==true if %ERRORLEVEL%==2 %site%\script\function\general_IMErepair.bat
if %A_rights%==true if %ERRORLEVEL%==3 ( cls & chkdsk & pause>nul )
if %A_rights%==true if %ERRORLEVEL%==4 ( cls & sfc /scannow & pause>nul ) 
if %A_rights%==true if %ERRORLEVEL%==7 ( cls & netsh winsock reset & pause>nul )
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo main_general >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto main_general

:error_a
if %function_autogeta%==true (
	echo main_general >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
mshta vbscript:msgbox("请先获取管理员权限，再使用这个功能",64,"LaSctip：提醒")(window.close)
goto main_general
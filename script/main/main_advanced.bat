:main_advanced
reg query "HKEY_CURRENT_USER" && set R_rights=true || set R_rights=false
if %function_notrtest%==true set R_rights=true
cls
echo.
echo   [] 进阶功能
echo.
if %A_rights%==true if %R_rights%==true (
	echo     ·1.运存释放
	echo     ·2.显示隐藏文件
	echo     ·3.锁定任务管理器
	echo     ·4.解锁任务管理器
	echo     ·5.锁定注册表
	echo     ·6.解锁注册表
	echo     ·7.激活 Windows
	echo     ·8.去除快捷方式图标小箭头
	)
if %A_rights%==true if %R_rights%==false (
	echo     ·1.运存释放
	echo  [r]·2.显示隐藏文件
	echo  [r]·3.锁定任务管理器
	echo  [r]·4.解锁任务管理器
	echo  [r]·5.锁定注册表
	echo  [r]·6.解锁注册表
	echo     ·7.激活 Windows
	echo  [r]·8.去除快捷方式图标小箭头
	)
if %A_rights%==false (
	echo     ·1.运存释放
	echo  [*]·2.显示隐藏文件
	echo  [*]·3.锁定任务管理器
	echo  [*]·4.解锁任务管理器
	echo  [*]·5.锁定注册表
	echo  [*]·6.解锁注册表
	echo  [*]·7.激活 Windows
	echo  [*]·8.去除快捷方式图标小箭头
	)
echo.
if %A_rights%==false echo     ·A.获取管理员权限
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 %site%script\function\advanced_cleanram.bat
if %R_rights%==false if %ERRORLEVEL%==2 goto error_r
if %R_rights%==false if %ERRORLEVEL%==3 goto error_r
if %R_rights%==false if %ERRORLEVEL%==4 goto error_r
if %R_rights%==false if %ERRORLEVEL%==5 goto error_r
if %R_rights%==false if %ERRORLEVEL%==6 goto error_r
if %R_rights%==false if %ERRORLEVEL%==8 goto error_r
if %A_rights%==false if %ERRORLEVEL%==2 goto error_a
if %A_rights%==false if %ERRORLEVEL%==3 goto error_a
if %A_rights%==false if %ERRORLEVEL%==4 goto error_a
if %A_rights%==false if %ERRORLEVEL%==5 goto error_a
if %A_rights%==false if %ERRORLEVEL%==6 goto error_a
if %A_rights%==false if %ERRORLEVEL%==7 goto error_a
if %A_rights%==false if %ERRORLEVEL%==8 goto error_a
if %A_rights%==true if %ERRORLEVEL%==2 %site%script\function\advanced_Hidden.bat
if %A_rights%==true if %ERRORLEVEL%==3 ( reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableTaskMgr /t REG_DWORD /d 00000001 /f )
if %A_rights%==true if %ERRORLEVEL%==4 ( reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableTaskMgr /t REG_DWORD /d 00000000 /f )
if %A_rights%==true if %ERRORLEVEL%==5 ( reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t reg_dword /d 00000001 /f )
if %A_rights%==true if %ERRORLEVEL%==6 ( reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t reg_dword /d 00000000 /f )
if %A_rights%==true if %ERRORLEVEL%==7 %site%script\function\advanced_winactivate.bat
if %A_rights%==true if %ERRORLEVEL%==8 (
	reg delete HKCR\lnkfile /v IsShortcut /f
	reg delete HKCR\piffile /v IsShortcut /f
	reg delete HKCR\InternetShortcut /v IsShortcut /f
	taskkill /f /im explorer.exe && explorer
	)
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo main_advanced >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto main_advanced

:error_a
if %function_autogeta%==true (
	echo main_advanced >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
mshta vbscript:msgbox("请先获取管理员权限，再使用这个功能",64,"LaSctip：提醒")(window.close)
goto main_advanced

:error_r
mshta vbscript:msgbox("注册表已被锁定，无法进行修改",16,"LaSctip：错误")(window.close)
goto main_advanced
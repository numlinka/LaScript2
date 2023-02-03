mode con cols=120 lines=30
echo off
if %A_rights%==false title 用户：%username%  ^|  LaScript_%version_name%_%version_number% - %version_type% - %Launch%
if %A_rights%==true title %username%  ^|  LaScript_%version_name%_%version_number% - %version_type% - %Launch%
set /p function_autogeta=<%site%\data\set\function_autogeta.ini || set function_autogeta=false
set /p function_notrtest=<%site%\data\set\function_notrtest.ini || set function_notrtest=false
set /p jump_temp=<%site%data\temp\jump_temp.ini && goto jump_temp_start || goto main_home
:main_home
mode con cols=120 lines=30
cls
echo.
echo   [] 主菜单
echo.
echo     ·1.常规
echo     ·2.进阶
echo     ·3.系统安全
if %A_rights%==true echo     ·4.SSD 优化
if %A_rights%==false echo  [*]·4.SSD 优化
echo.
echo     ·5.SHA-1
echo.
echo     ·8.回收站
echo     ·9.Test Function
echo.
echo.
if %A_rights%==false echo     ·A.获取 管理员 权限
if %A_rights%==true echo     ·S.控制中心
if %A_rights%==false echo  [*]·S.控制中心
echo     ·Z.电源选项
echo.
echo     ·X.退出
echo.

choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 %site%script\main\main_general.bat
if %ERRORLEVEL%==2 %site%script\main\main_advanced.bat
if %ERRORLEVEL%==3 %site%script\main\main_security.bat
if %A_rights%==true if %ERRORLEVEL%==4 %site%script\main\main_SSD.bat
if %A_rights%==false if %ERRORLEVEL%==4 (
	echo main_SSD >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==5 start expandtools\SHA1.bat
if %ERRORLEVEL%==8 %site%script\RecycleBin\main_RecycleBin.bat
if %ERRORLEVEL%==9 %site%script\temp\main_temp.bat
if %A_rights%==false if %ERRORLEVEL%==11 %site%script\A_get\A_get.bat
if %A_rights%==true if %ERRORLEVEL%==12 %site%script\set\set_main.bat
if %A_rights%==false if %ERRORLEVEL%==12 (
	echo set_main >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==13 %site%script\power_options.bat
if %ERRORLEVEL%==14 exit
goto main_home

:jump_temp_start
del %site%data\temp\jump_temp.ini
if %A_rights%==false goto main_home
if %jump_temp%==set_main %site%script\set\set_main.bat
if %jump_temp%==main_general %site%script\main\main_general.bat
if %jump_temp%==main_advanced %site%script\main\main_advanced.bat
if %jump_temp%==main_security %site%script\main\main_security.bat
if %jump_temp%==power_options %site%script\power_options.bat
if %jump_temp%==advanced_cleanram %site%script\function\advanced_cleanram.bat
if %jump_temp%==main_temp %site%script\temp\main_temp.bat
if %jump_temp%==main_RecycleBin %site%\script\RecycleBin\main_RecycleBin.bat
if %jump_temp%==main_SSD %site%script\main\main_SSD.bat
goto main_home
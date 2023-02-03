set /p A_get_type=<%site%data\set\A_get_type.ini || set A_get_type=3
set /p Launch_PowerShell=<%site%data\set\Launch_PowerShell.ini || set Launch_PowerShell=false
if %Launch_PowerShell%==0 set Launch_PowerShell=false
if %Launch_PowerShell%==1 set Launch_PowerShell=true
:set_main
cls
echo.
echo   [] 控制中心
echo.
if %color_1%==0 echo     ·1.背景颜色                  黑色
if %color_1%==1 echo     ·1.背景颜色                  蓝色
if %color_1%==2 echo     ·1.背景颜色                  绿色
if %color_1%==3 echo     ·1.背景颜色                  浅绿色
if %color_1%==4 echo     ·1.背景颜色                  红色
if %color_1%==5 echo     ·1.背景颜色                  紫色
if %color_1%==6 echo     ·1.背景颜色                  黄色
if %color_1%==7 echo     ·1.背景颜色                  白色
if %color_1%==8 echo     ·1.背景颜色                  灰色
if %color_1%==9 echo     ·1.背景颜色                  淡蓝色
if %color_1%==a echo     ·1.背景颜色                  淡绿色
if %color_1%==A echo     ·1.背景颜色                  淡绿色
if %color_1%==b echo     ·1.背景颜色                  淡浅绿色
if %color_1%==B echo     ·1.背景颜色                  淡浅绿色
if %color_1%==c echo     ·1.背景颜色                  淡红色
if %color_1%==C echo     ·1.背景颜色                  淡红色
if %color_1%==d echo     ·1.背景颜色                  淡紫色
if %color_1%==D echo     ·1.背景颜色                  淡紫色
if %color_1%==e echo     ·1.背景颜色                  淡黄色
if %color_1%==E echo     ·1.背景颜色                  淡黄色
if %color_1%==f echo     ·1.背景颜色                  亮白色
if %color_1%==F echo     ·1.背景颜色                  亮白色
if %color_2%==0 echo     ·2.前景颜色                  黑色
if %color_2%==1 echo     ·2.前景颜色                  蓝色
if %color_2%==2 echo     ·2.前景颜色                  绿色
if %color_2%==3 echo     ·2.前景颜色                  浅绿色
if %color_2%==4 echo     ·2.前景颜色                  红色
if %color_2%==5 echo     ·2.前景颜色                  紫色
if %color_2%==6 echo     ·2.前景颜色                  黄色
if %color_2%==7 echo     ·2.前景颜色                  白色
if %color_2%==8 echo     ·2.前景颜色                  灰色
if %color_2%==9 echo     ·2.前景颜色                  淡蓝色
if %color_2%==a echo     ·2.前景颜色                  淡绿色
if %color_2%==A echo     ·2.前景颜色                  淡绿色
if %color_2%==b echo     ·2.前景颜色                  淡浅绿色
if %color_2%==B echo     ·2.前景颜色                  淡浅绿色
if %color_2%==c echo     ·2.前景颜色                  淡红色
if %color_2%==C echo     ·2.前景颜色                  淡红色
if %color_2%==d echo     ·2.前景颜色                  淡紫色
if %color_2%==D echo     ·2.前景颜色                  淡紫色
if %color_2%==e echo     ·2.前景颜色                  淡黄色
if %color_2%==E echo     ·2.前景颜色                  淡黄色
if %color_2%==f echo     ·2.前景颜色                  亮白色
if %color_2%==F echo     ·2.前景颜色                  亮白色
echo.
if %A_get%==false (
	if %A_get_type%==1 echo     ·3.管理员权限获取方案          方案一
	if %A_get_type%==2 echo     ·3.管理员权限获取方案          方案二
	if %A_get_type%==3 echo     ·3.管理员权限获取方案          方案三
	if %A_get_type%==4 echo     ·3.管理员权限获取方案          方案四
	if %A_get_type%==5 echo     ·3.管理员权限获取方案          方案五
	echo     ·4.启动时自动请求管理员权限    否
	)
if %A_get%==true (
	echo  [-]·3.管理员权限获取方案          方案一
	echo     ·4.启动时自动请求管理员权限    是
	)
echo.
if %function_autogeta%==false echo     ·5.在需要时自动请求管理员权限    否
if %function_autogeta%==true echo     ·5.在需要时自动请求管理员权限    是
if %function_notrtest%==false echo     ·6.无视注册表检查结果            否
if %function_notrtest%==true echo     ·6.无视注册表检查结果            是
echo.
if %command_PowerShell%==true (
	if %Launch_PowerShell%==false echo     ·7.使用 PowerShell 执行脚本    否
	if %Launch_PowerShell%==true echo     ·7.使用 PowerShell 执行脚本    是
	)
if %command_PowerShell%==false echo  [\]·7.使用 PowerShell 执行脚本    [未检测到]
echo.
echo     ·0.清除数据并退出脚本
echo.
echo     ·X.退出
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 %site%script\set\set_color_1.bat
if %ERRORLEVEL%==2 %site%script\set\set_color_2.bat
if %ERRORLEVEL%==3 %site%script\set\set_A_get_type.bat
if %ERRORLEVEL%==4 %site%script\set\set_A_get.bat
if %ERRORLEVEL%==5 %site%script\set\set_function_autogeta.bat
if %ERRORLEVEL%==6 %site%script\set\set_function_notrtest.bat
if %command_PowerShell%==true if %ERRORLEVEL%==7 %site%script\set\set_Launch_PowerShell.bat
if %ERRORLEVEL%==10 goto set_deldata
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto set_main

:set_deldata
del /f /s /q %site%data\*
rd /s /q %site%data
exit

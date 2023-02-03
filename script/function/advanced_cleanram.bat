set cleanram_fi=true
set cleanram_t=false
set cleanram_f=true
set cleanram_type=false
set cleanram_fi_user=%username%
set cleanram_fi_notcmd=true
set cleanram_fi_notconhost=true
:advanced_cleanram
set error=false
set warn=false
set hint=false
set error_st=false
set error_nd=false
set error_rd=false
set error_th=false
set warn_st=false
set warn_nd=false
set warn_rd=false
set warn_th=false
set hint_st=false
set hint_nd=false
set hint_rd=false
set hint_th=false
if %cleanram_fi%==false ( set error=true & set error_st=true )
if %cleanram_fi_user%==false if %cleanram_fi_notcmd%==false if %cleanram_fi_notconhost%==false ( set error=true & set error_nd=true & set error_st=true )
if %cleanram_fi_user%==SYSTEM ( set warn=true & set warn_st=true )
if %cleanram_fi_user%==postgres ( set warn=true & set warn_nd=true )
if %cleanram_fi_user%==false ( set warn=true & set warn_rd=true & set warn_st=true & set warn_nd=true )
if %cleanram_fi_notcmd%==false ( set hint=true & set hint_st=true )
if %cleanram_fi_notconhost%==false ( set hint=true & set hint_nd=true )
if %cleanram_f%==false ( set hint=true & set hint_rd=true )
cls
echo.
echo   [] 运存释放
echo.
if %cleanram_type%==true (
	echo     ·_.指定系统    [ 暂不支持 ]
	echo     ·_.指定用户    [ 暂不支持 - 需要指定系统 ]
	echo     ·_.用户密码    [ 暂不支持 - 需要指定用户 ]
	)
if %cleanram_fi%==true (
	echo     ·1.筛选器                 是
	if %cleanram_fi_user%==false echo       - 4.指定用户名          不指定
	if %cleanram_fi_user%==%username% echo       - 4.指定用户名            %username%
	if %cleanram_fi_user%==SYSTEM echo       - 4.指定用户名            SYSTEM
	if %cleanram_fi_notcmd%==true echo       - 5.否定cmd.exe         是
	if %cleanram_fi_notcmd%==false echo       - 5.否定cmd.exe       否
	if %cleanram_fi_notconhost%==true echo       - 6.否定conhost.exe     是
	if %cleanram_fi_notconhost%==false echo       - 6.否定conhost.exe   否
	echo.
	)
if %cleanram_fi%==false echo     ·1.筛选器               否
if %cleanram_t%==true echo     ·2.结束其子进程           是
if %cleanram_t%==false echo     ·2.结束其子进程         否
if %cleanram_f%==true echo     ·3.强制终止进程           是
if %cleanram_f%==false echo     ·3.强制终止进程         否
echo.
if %cleanram_type%==true (
	echo     ·_.指定进程 PID      [ 暂不支持 ]
	echo     ·_.指定进程映像名    [ 暂不支持 ]
	echo.
	)
if %A_rights%==false echo     ·A.管理员权限           否
if %A_rights%==true echo     ·_.管理员权限             是
echo.
if %error%==false (
	if %warn%==false echo     ·S - 执行
	if %warn%==true echo     ·S - 强制执行
	)
if %error%==true (
	if %error_st%==true echo     [ 错误 ] - 必须指定筛选器
	if %error_nd%==true echo     [ 错误 ] - 筛选器指定条件不足
	)
if %warn%==true (
	if %warn_rd%==true echo     [ 警告 ] - 不指定用户会影响到所有用户 包括 SYSTEM
	if %warn_st%==true echo     [ 警告 ] - 管理员权限下指定SYSTEM会造成系统崩溃甚至蓝屏
	)
if %hint%==true (
	if %hint_st%==true echo     [ 提醒 ] - 不否定cmd.exe会导致命令解释器被提前关闭 而无法达到预期的效果
	if %hint_nd%==true echo     [ 提醒 ] - 不否定conhost.exe会导致命令解释器被提前关闭
	@REM if %hint_rd%==true echo     [ 提醒 ] - 不指定强制终止 某些需要二次确认的进程将无法关闭
	)
echo.
if %cleanram_type%==false echo     ·Z.显示全部选项
if %cleanram_type%==true echo     ·Z.隐藏部分选项
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 (
	if %cleanram_fi%==true set cleanram_fi=false
	if %cleanram_fi%==false set cleanram_fi=true
	)
if %ERRORLEVEL%==2 (
	if %cleanram_t%==true set cleanram_t=false
	if %cleanram_t%==false set cleanram_t=true
	)
if %ERRORLEVEL%==3 (
	if %cleanram_f%==true set cleanram_f=false
	if %cleanram_f%==false set cleanram_f=true
	)
if %ERRORLEVEL%==4 (
	if %cleanram_fi_user%==false set cleanram_fi_user=%username%
	if %cleanram_fi_user%==%username% set cleanram_fi_user=SYSTEM
	if %cleanram_fi_user%==SYSTEM set cleanram_fi_user=false
	)
if %ERRORLEVEL%==5 (
	if %cleanram_fi_notcmd%==true set cleanram_fi_notcmd=false
	if %cleanram_fi_notcmd%==false set cleanram_fi_notcmd=true
	)
if %ERRORLEVEL%==6 (
	if %cleanram_fi_notconhost%==true set cleanram_fi_notconhost=false
	if %cleanram_fi_notconhost%==false set cleanram_fi_notconhost=true
	)
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo advanced_cleanram >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==12 if %error%==false goto start_if
if %ERRORLEVEL%==13 (
	if %cleanram_type%==true set cleanram_type=false
	if %cleanram_type%==false set cleanram_type=true
	)
if %ERRORLEVEL%==14 %site%script\main\main_advanced.bat
goto advanced_cleanram

:start_if
if %cleanram_fi_user%==false goto start_if_notuser
goto start_ifnd

:start_if_notuser
if %cleanram_fi_notcmd%==true if %cleanram_fi_notconhost%==true (
	if %cleanram_t%==true if %cleanram_f%==true taskkill /fi "imagename ne emd.exe" /fi "imagename ne conhost.exe" /im * /f /t
	if %cleanram_t%==false if %cleanram_f%==true taskkill /fi "imagename ne emd.exe" /fi "imagename ne conhost.exe" /im * /f
	if %cleanram_t%==true if %cleanram_f%==false taskkill /fi "imagename ne emd.exe" /fi "imagename ne conhost.exe" /im * /t
	if %cleanram_t%==false if %cleanram_f%==false taskkill /fi "imagename ne emd.exe" /fi "imagename ne conhost.exe" /im *
	)
if %cleanram_fi_notcmd%==false if %cleanram_fi_notconhost%==true (
	if %cleanram_t%==true if %cleanram_f%==true taskkill /fi "imagename ne conhost.exe" /im * /f /t
	if %cleanram_t%==false if %cleanram_f%==true taskkill /fi "imagename ne conhost.exe" /im * /f
	if %cleanram_t%==true if %cleanram_f%==false taskkill /fi "imagename ne conhost.exe" /im * /t
	if %cleanram_t%==false if %cleanram_f%==false taskkill /fi "imagename ne conhost.exe" /im *
	)
if %cleanram_fi_notcmd%==true if %cleanram_fi_notconhost%==false (
	if %cleanram_t%==true if %cleanram_f%==true taskkill /fi "imagename ne emd.exe" /im * /f /t
	if %cleanram_t%==false if %cleanram_f%==true taskkill /fi "imagename ne emd.exe" /im * /f
	if %cleanram_t%==true if %cleanram_f%==false taskkill /fi "imagename ne emd.exe" /im * /t
	if %cleanram_t%==false if %cleanram_f%==false taskkill /fi "imagename ne emd.exe" /im *
	)
goto advanced_cleanram

:start_ifnd
if %cleanram_fi_notcmd%==true if %cleanram_fi_notconhost%==true (
	if %cleanram_t%==true if %cleanram_f%==true taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne emd.exe" /fi "imagename ne conhost.exe" /im * /f /t
	if %cleanram_t%==false if %cleanram_f%==true taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne emd.exe" /fi "imagename ne conhost.exe" /im * /f
	if %cleanram_t%==true if %cleanram_f%==false taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne emd.exe" /fi "imagename ne conhost.exe" /im * /t
	if %cleanram_t%==false if %cleanram_f%==false taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne emd.exe" /fi "imagename ne conhost.exe" /im *
	)
if %cleanram_fi_notcmd%==false if %cleanram_fi_notconhost%==true (
	if %cleanram_t%==true if %cleanram_f%==true taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne conhost.exe" /im * /f /t
	if %cleanram_t%==false if %cleanram_f%==true taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne conhost.exe" /im * /f
	if %cleanram_t%==true if %cleanram_f%==false taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne conhost.exe" /im * /t
	if %cleanram_t%==false if %cleanram_f%==false taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne conhost.exe" /im *
	)
if %cleanram_fi_notcmd%==true if %cleanram_fi_notconhost%==false (
	if %cleanram_t%==true if %cleanram_f%==true taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne emd.exe" /im * /f /t
	if %cleanram_t%==false if %cleanram_f%==true taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne emd.exe" /im * /f
	if %cleanram_t%==true if %cleanram_f%==false taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne emd.exe" /im * /t
	if %cleanram_t%==false if %cleanram_f%==false taskkill /fi "username eq %cleanram_fi_user%" /fi "imagename ne emd.exe" /im *
	)
if %cleanram_fi_notcmd%==false if %cleanram_fi_notconhost%==false (
	if %cleanram_t%==true if %cleanram_f%==true taskkill /fi "username eq %cleanram_fi_user%" /im * /f /t
	if %cleanram_t%==false if %cleanram_f%==true taskkill /fi "username eq %cleanram_fi_user%" /im * /f
	if %cleanram_t%==true if %cleanram_f%==false taskkill /fi "username eq %cleanram_fi_user%" /im * /t
	if %cleanram_t%==false if %cleanram_f%==false taskkill /fi "username eq %cleanram_fi_user%" /im *
	)
goto advanced_cleanram
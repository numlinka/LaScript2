echo off
:test_0
set expand_command=true
set command_choice=true
set command_msg=true
set command_mshta=true
set command_wscript=true
set command_cscript=true
set command_slmgr=true
cls
echo.
echo ^>^>^>检查运行环境...
if not exist "%systemdrive%\Windows\System32\choice.exe" ( set expand_command=false & set command_choice=false )
::if not exist "%systemdrive%\Windows\System32\msg.exe" ( set expand_command=false & set command_msg=false )
if not exist "%systemdrive%\Windows\System32\mshta.exe" ( set expand_command=false & set command_mshta=false )
if not exist "%systemdrive%\Windows\System32\wscript.exe" ( set expand_command=false & set command_wscript=false )
if not exist "%systemdrive%\Windows\System32\cscript.exe" ( set expand_command=false & set command_cscript=false )
if not exist "%systemdrive%\Windows\System32\slmgr.vbs" ( set expand_command=false & set command_slmgr=false )
if %expand_command%==false (
	echo.
	if %command_choice%==false echo     缺少 拓展命令 choice
	if %command_msg%==false echo     缺少 拓展命令 msg
	if %command_mshta%==false echo     缺少 拓展命令 mshta
	if %command_wscript%==false echo     缺少 拓展命令 wscript
	if %command_cscript%==false echo     缺少 拓展命令 cscript
	if %command_slmgr%==false echo     缺少 拓展命令 slmgr
	pause>nul
	exit
	)

:test_1
ver|findstr /r /i " [版本 10.0.*]" > NUL || goto error_0

:test_2
::set command_PowerShell=false
powershell /? >nul && set command_PowerShell=true || set command_PowerShell=false
::if exist "%systemdrive%\Windows\System32\WindowsPowerShell" set command_PowerShell=true

Launch_0
if %command_PowerShell%==true goto Launch_PowerShell

::%site%repair\not_choice.bat

:over
if %mode_compatible%==true goto error_2
cls
echo. & echo   正在启动主程式...
%site%script\test\Completeness.bat
%site%script\main_home.bat
goto error_1

:Launch_PowerShell
set /p Launch_PowerShell=<%site%data\set\Launch_PowerShell.ini && %site%script\A_get\Launch_PowerShell.bat || goto over
goto over

:error_0
mshta vbscript:msgbox("您的计算机系统不是 Windows 10+"+vbCrLf+"脚本的指令只对 Windows 10 编写和优化"+vbCrLf+"非 Windows 10 用户无法正常使用某些功能",64,"LaScript：提醒")(window.close)
goto over

:error_1
echo. & echo   启动失败：未能找到目标文件
mshta vbscript:msgbox("目标文件不存在或已被损坏",16,"LaScript：错误")(window.close)
exit
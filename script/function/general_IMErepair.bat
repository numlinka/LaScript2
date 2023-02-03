echo off
:general_IMErepair
set step=0
:general_IMErepair_type_1
cls
echo.
echo ^>^>^>修复 IME 已禁用
echo.
if %step% equ 1 echo   停止 服务 SysMain                 执行中...
if %step% gtr 1 echo   停止 服务 SysMain                 已完成
if %step% lss 2 echo   停止 服务 Superfetch              等待
if %step% equ 2 echo   停止 服务 Superfetch              执行中...
if %step% gtr 2 echo   停止 服务 Superfetch              已完成
if %step% lss 3 echo   启动 服务 Schedule                等待
if %step% equ 3 echo   启动 服务 Schedule                执行中...
if %step% gtr 3 echo   启动 服务 Schedule                已完成
if %step% lss 4 echo   结束 任务计划 MsCtfMonitor        等待
if %step% equ 4 echo   结束 任务计划 MsCtfMonitor        执行中...
if %step% gtr 4 echo   结束 任务计划 MsCtfMonitor        已完成
if %step% lss 5 echo   启动 任务计划 MsCtfMonitor        等待
if %step% equ 5 echo   启动 任务计划 MsCtfMonitor        执行中...
if %step% gtr 5 echo   启动 任务计划 MsCtfMonitor        已完成
if %step% lss 6 echo   结束 进程 ChsIME.exe              等待
if %step% equ 6 echo   结束 进程 ChsIME.exe              执行中...
if %step% gtr 6 echo   结束 进程 ChsIME.exe              已完成
if %step% lss 7 ( echo. & echo. & echo  详情信息： ) 
if %step% equ 7 (
	echo.
	echo                                    执行完毕
	echo      -按任意键返回-
	pause>nul
	%site%script\main\main_general.bat
	)
if %step%==1 net stop SysMain
if %step%==2 net stop Superfetch
if %step%==3 net Start Schedule
if %step%==4 schtasks /End /TN "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor"
if %step%==5 schtasks /Run /TN "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor"
if %step%==6 taskkill /F /IM ChsIME.exe
set /a step=%step%+1
goto general_IMErepair_type_1
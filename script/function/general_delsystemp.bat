echo off
:general_delsystemp
set step=0
echo %step% >%site%data\temp\step.ini
start "LaScript" %site%script\function\general_delsystemp_main.bat
set /p general_delsystemp_type=<%site%data\diy\general_delsystemp_type.ini || set general_delsystemp_type=1
if %general_delsystemp_type%==1 goto general_delsystemp_type_1
if %general_delsystemp_type%==2 goto general_delsystemp_type_2

:general_delsystemp_type_1
echo %step% >%site%data\temp\step.ini
cls
echo.
echo ^>^>^>清理系统缓存
echo.
if %step% lss 16 echo     - 当前 [ %step% / 15 ]
if %step% lss 16 echo.
if %step% lss 16 echo  错误信息：
if %step% equ 16 ( echo.
	echo                                                                 执行完毕
	echo      -按任意键返回-
	pause>nul
	goto over
	)
if %step%==1 ( del /f /s /q %systemdrive%\*.tmp >nul )
if %step%==2 ( del /f /s /q %systemdrive%\*._mp >nul )
if %step%==3 ( del /f /s /q %systemdrive%\*.log >nul )
if %step%==4 ( del /f /s /q %systemdrive%\*.gid >nul )
if %step%==5 ( del /f /s /q %systemdrive%\*.chk >nul )
if %step%==6 ( del /f /s /q %systemdrive%\*.old >nul )
if %step%==7 ( del /f /s /q %systemdrive%\recycled\*.* >nul )
if %step%==8 ( del /f /s /q %windir%\*.bak >nul )
if %step%==9 ( del /f /s /q %windir%\prefetch\*.* >nul )
if %step%==10 ( rd /s /q %windir%\temp & md %windir%\temp >nul )
if %step%==11 ( del /f /q %userprofile%\cookies\*.* >nul )
if %step%==12 ( del /f /q %userprofile%\recent\*.* >nul )
if %step%==13 ( del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" >nul )
if %step%==14 ( del /f /s /q "%userprofile%\Local Settings\Temp\*.*" >nul )
if %step%==15 ( del /f /s /q "%userprofile%\recent\*.*" >nul )
set /a step=%step%+1
goto general_delsystemp_type_1

:general_delsystemp_type_2
cls
echo.
echo ^>^>^>清理系统缓存
echo.
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
echo.
echo     -清理完成-
pause>nul

:over
%site%script\main\main_general.bat || %site%script\error_test.bat
exit
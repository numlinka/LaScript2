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
echo ^>^>^>������л���...
if not exist "%systemdrive%\Windows\System32\choice.exe" ( set expand_command=false & set command_choice=false )
::if not exist "%systemdrive%\Windows\System32\msg.exe" ( set expand_command=false & set command_msg=false )
if not exist "%systemdrive%\Windows\System32\mshta.exe" ( set expand_command=false & set command_mshta=false )
if not exist "%systemdrive%\Windows\System32\wscript.exe" ( set expand_command=false & set command_wscript=false )
if not exist "%systemdrive%\Windows\System32\cscript.exe" ( set expand_command=false & set command_cscript=false )
if not exist "%systemdrive%\Windows\System32\slmgr.vbs" ( set expand_command=false & set command_slmgr=false )
if %expand_command%==false (
	echo.
	if %command_choice%==false echo     ȱ�� ��չ���� choice
	if %command_msg%==false echo     ȱ�� ��չ���� msg
	if %command_mshta%==false echo     ȱ�� ��չ���� mshta
	if %command_wscript%==false echo     ȱ�� ��չ���� wscript
	if %command_cscript%==false echo     ȱ�� ��չ���� cscript
	if %command_slmgr%==false echo     ȱ�� ��չ���� slmgr
	pause>nul
	exit
	)

:test_1
ver|findstr /r /i " [�汾 10.0.*]" > NUL || goto error_0

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
echo. & echo   ������������ʽ...
%site%script\test\Completeness.bat
%site%script\main_home.bat
goto error_1

:Launch_PowerShell
set /p Launch_PowerShell=<%site%data\set\Launch_PowerShell.ini && %site%script\A_get\Launch_PowerShell.bat || goto over
goto over

:error_0
mshta vbscript:msgbox("���ļ����ϵͳ���� Windows 10+"+vbCrLf+"�ű���ָ��ֻ�� Windows 10 ��д���Ż�"+vbCrLf+"�� Windows 10 �û��޷�����ʹ��ĳЩ����",64,"LaScript������")(window.close)
goto over

:error_1
echo. & echo   ����ʧ�ܣ�δ���ҵ�Ŀ���ļ�
mshta vbscript:msgbox("Ŀ���ļ������ڻ��ѱ���",16,"LaScript������")(window.close)
exit
:main_RecycleBin
reg query "HKEY_CURRENT_USER" && set R_rights=true || set R_rights=false
if %function_notrtest%==true set R_rights=true
cls
echo.
echo   [] ����վ
echo.
if %A_rights%==true if %R_rights%==true (
	echo     ��1.͸������
	)
if %A_rights%==true if %R_rights%==false (
	echo  [r]��1.͸������
	)
if %A_rights%==false (
	echo  [*]��1.͸������
	)
echo.
if %A_rights%==false echo     ��A.��ȡ����ԱȨ��
echo     ��X.����
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %R_rights%==false if %ERRORLEVEL%==1 goto error_r
if %A_rights%==false if %ERRORLEVEL%==1 goto error_a
if %A_rights%==true if %ERRORLEVEL%==1 (
	reg add "HKCU\Software\Microsoft\Windows\DWM" /v Composition /t reg_dword /d 00000001 /f
	reg add "HKCU\Software\Microsoft\Windows\DWM" /v CompositionPolicy /t reg_dword /d 00000002 /f
	net stop uxsms
	net start uxsms
	)
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo main_RecycleBin >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto main_RecycleBin

:error_a
if %function_autogeta%==true (
	echo main_RecycleBin >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
mshta vbscript:msgbox("���Ȼ�ȡ����ԱȨ�ޣ���ʹ���������",64,"LaSctip������")(window.close)
goto main_RecycleBin

:error_r
mshta vbscript:msgbox("ע����ѱ��������޷������޸�",16,"LaSctip������")(window.close)
goto main_RecycleBin
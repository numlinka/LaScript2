:main_advanced
reg query "HKEY_CURRENT_USER" && set R_rights=true || set R_rights=false
if %function_notrtest%==true set R_rights=true
cls
echo.
echo   [] ���׹���
echo.
if %A_rights%==true if %R_rights%==true (
	echo     ��1.�˴��ͷ�
	echo     ��2.��ʾ�����ļ�
	echo     ��3.�������������
	echo     ��4.�������������
	echo     ��5.����ע���
	echo     ��6.����ע���
	echo     ��7.���� Windows
	echo     ��8.ȥ����ݷ�ʽͼ��С��ͷ
	)
if %A_rights%==true if %R_rights%==false (
	echo     ��1.�˴��ͷ�
	echo  [r]��2.��ʾ�����ļ�
	echo  [r]��3.�������������
	echo  [r]��4.�������������
	echo  [r]��5.����ע���
	echo  [r]��6.����ע���
	echo     ��7.���� Windows
	echo  [r]��8.ȥ����ݷ�ʽͼ��С��ͷ
	)
if %A_rights%==false (
	echo     ��1.�˴��ͷ�
	echo  [*]��2.��ʾ�����ļ�
	echo  [*]��3.�������������
	echo  [*]��4.�������������
	echo  [*]��5.����ע���
	echo  [*]��6.����ע���
	echo  [*]��7.���� Windows
	echo  [*]��8.ȥ����ݷ�ʽͼ��С��ͷ
	)
echo.
if %A_rights%==false echo     ��A.��ȡ����ԱȨ��
echo     ��X.����
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
mshta vbscript:msgbox("���Ȼ�ȡ����ԱȨ�ޣ���ʹ���������",64,"LaSctip������")(window.close)
goto main_advanced

:error_r
mshta vbscript:msgbox("ע����ѱ��������޷������޸�",16,"LaSctip������")(window.close)
goto main_advanced
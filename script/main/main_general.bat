:main_general
cls
echo.
echo   [] ���湦��
echo.
if %A_rights%==true (
	echo     ��1.����ϵͳ����
	echo     ��2.�޸�"ITM�ѽ���"
	echo     ��3.������
	echo     ��4.�޸��𻵵�ϵͳ�ļ�
	echo     ��5.��ʾ���ز���ϵͳ��������Ϣ
	echo     ��6.�����洴������̨�ļ���
	echo     ��7.��ʼ�����绷��
	echo     ��8.�鿴���� WLAN �ӿ����������ļ���������Ϣ
	)
if %A_rights%==false (
	echo     ��1.����ϵͳ����
	echo  [*]��2.�޸�"ITM�ѽ���"
	echo  [*]��3.������
	echo  [*]��4.�޸��𻵵�ϵͳ�ļ�
	echo     ��5.��ʾ���ز���ϵͳ��������Ϣ
	echo     ��6.�����洴������̨�ļ���
	echo  [*]��7.��ʼ�����绷��
	echo     ��8.�鿴���� WLAN �ӿ����������ļ���������Ϣ
	)
echo.
if %A_rights%==false echo     ��A.��ȡ����ԱȨ��
echo     ��X.����
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 %site%script\function\general_delsystemp.bat
if %ERRORLEVEL%==5 start "systeminfo" %site%\script\function\general_systeminfo.bat
if %ERRORLEVEL%==6 md "%site_desktop%GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
if %ERRORLEVEL%==8 start "netsh" %site%\script\function\general_netsh.bat
if %A_rights%==false if %ERRORLEVEL%==2 goto error_a
if %A_rights%==false if %ERRORLEVEL%==3 goto error_a
if %A_rights%==false if %ERRORLEVEL%==4 goto error_a
if %A_rights%==false if %ERRORLEVEL%==7 goto error_a
if %A_rights%==true if %ERRORLEVEL%==2 %site%\script\function\general_IMErepair.bat
if %A_rights%==true if %ERRORLEVEL%==3 ( cls & chkdsk & pause>nul )
if %A_rights%==true if %ERRORLEVEL%==4 ( cls & sfc /scannow & pause>nul ) 
if %A_rights%==true if %ERRORLEVEL%==7 ( cls & netsh winsock reset & pause>nul )
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo main_general >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto main_general

:error_a
if %function_autogeta%==true (
	echo main_general >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
mshta vbscript:msgbox("���Ȼ�ȡ����ԱȨ�ޣ���ʹ���������",64,"LaSctip������")(window.close)
goto main_general
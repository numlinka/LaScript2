:main_security
cls
echo.
echo   [] ϵͳ��ȫ
echo.

if %A_rights%==true (
	echo     ��1.�ر� 135.137.138.139.445 �˿�
	)
if %A_rights%==false (
	echo  [*]��1.�ر� 135.137.138.139.445 �˿�
	)
echo.
if %A_rights%==false echo     ��A.��ȡ����ԱȨ��
echo     ��X.����
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %A_rights%==false if %ERRORLEVEL%==1 goto error_a
if %A_rights%==true if %ERRORLEVEL%==1 %site%script\function\security_closeport_st.bat
if %ERRORLEVEL%==11 if %A_rights%==false (
	echo main_security >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto main_security

:error_a
if %function_autogeta%==true (
	echo main_security >%site%data\temp\jump_temp.ini
	%site%script\A_get\A_get.bat
	)
mshta vbscript:msgbox("���Ȼ�ȡ����ԱȨ�ޣ���ʹ���������",64,"LaSctip������")(window.close)
goto main_security
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
echo   [] �˴��ͷ�
echo.
if %cleanram_type%==true (
	echo     ��_.ָ��ϵͳ    [ �ݲ�֧�� ]
	echo     ��_.ָ���û�    [ �ݲ�֧�� - ��Ҫָ��ϵͳ ]
	echo     ��_.�û�����    [ �ݲ�֧�� - ��Ҫָ���û� ]
	)
if %cleanram_fi%==true (
	echo     ��1.ɸѡ��                 ��
	if %cleanram_fi_user%==false echo       - 4.ָ���û���          ��ָ��
	if %cleanram_fi_user%==%username% echo       - 4.ָ���û���            %username%
	if %cleanram_fi_user%==SYSTEM echo       - 4.ָ���û���            SYSTEM
	if %cleanram_fi_notcmd%==true echo       - 5.��cmd.exe         ��
	if %cleanram_fi_notcmd%==false echo       - 5.��cmd.exe       ��
	if %cleanram_fi_notconhost%==true echo       - 6.��conhost.exe     ��
	if %cleanram_fi_notconhost%==false echo       - 6.��conhost.exe   ��
	echo.
	)
if %cleanram_fi%==false echo     ��1.ɸѡ��               ��
if %cleanram_t%==true echo     ��2.�������ӽ���           ��
if %cleanram_t%==false echo     ��2.�������ӽ���         ��
if %cleanram_f%==true echo     ��3.ǿ����ֹ����           ��
if %cleanram_f%==false echo     ��3.ǿ����ֹ����         ��
echo.
if %cleanram_type%==true (
	echo     ��_.ָ������ PID      [ �ݲ�֧�� ]
	echo     ��_.ָ������ӳ����    [ �ݲ�֧�� ]
	echo.
	)
if %A_rights%==false echo     ��A.����ԱȨ��           ��
if %A_rights%==true echo     ��_.����ԱȨ��             ��
echo.
if %error%==false (
	if %warn%==false echo     ��S - ִ��
	if %warn%==true echo     ��S - ǿ��ִ��
	)
if %error%==true (
	if %error_st%==true echo     [ ���� ] - ����ָ��ɸѡ��
	if %error_nd%==true echo     [ ���� ] - ɸѡ��ָ����������
	)
if %warn%==true (
	if %warn_rd%==true echo     [ ���� ] - ��ָ���û���Ӱ�쵽�����û� ���� SYSTEM
	if %warn_st%==true echo     [ ���� ] - ����ԱȨ����ָ��SYSTEM�����ϵͳ������������
	)
if %hint%==true (
	if %hint_st%==true echo     [ ���� ] - ����cmd.exe�ᵼ���������������ǰ�ر� ���޷��ﵽԤ�ڵ�Ч��
	if %hint_nd%==true echo     [ ���� ] - ����conhost.exe�ᵼ���������������ǰ�ر�
	@REM if %hint_rd%==true echo     [ ���� ] - ��ָ��ǿ����ֹ ĳЩ��Ҫ����ȷ�ϵĽ��̽��޷��ر�
	)
echo.
if %cleanram_type%==false echo     ��Z.��ʾȫ��ѡ��
if %cleanram_type%==true echo     ��Z.���ز���ѡ��
echo     ��X.����
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
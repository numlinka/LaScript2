set /p A_get_type=<%site%data\set\A_get_type.ini || set A_get_type=3
set /p Launch_PowerShell=<%site%data\set\Launch_PowerShell.ini || set Launch_PowerShell=false
if %Launch_PowerShell%==0 set Launch_PowerShell=false
if %Launch_PowerShell%==1 set Launch_PowerShell=true
:set_main
cls
echo.
echo   [] ��������
echo.
if %color_1%==0 echo     ��1.������ɫ                  ��ɫ
if %color_1%==1 echo     ��1.������ɫ                  ��ɫ
if %color_1%==2 echo     ��1.������ɫ                  ��ɫ
if %color_1%==3 echo     ��1.������ɫ                  ǳ��ɫ
if %color_1%==4 echo     ��1.������ɫ                  ��ɫ
if %color_1%==5 echo     ��1.������ɫ                  ��ɫ
if %color_1%==6 echo     ��1.������ɫ                  ��ɫ
if %color_1%==7 echo     ��1.������ɫ                  ��ɫ
if %color_1%==8 echo     ��1.������ɫ                  ��ɫ
if %color_1%==9 echo     ��1.������ɫ                  ����ɫ
if %color_1%==a echo     ��1.������ɫ                  ����ɫ
if %color_1%==A echo     ��1.������ɫ                  ����ɫ
if %color_1%==b echo     ��1.������ɫ                  ��ǳ��ɫ
if %color_1%==B echo     ��1.������ɫ                  ��ǳ��ɫ
if %color_1%==c echo     ��1.������ɫ                  ����ɫ
if %color_1%==C echo     ��1.������ɫ                  ����ɫ
if %color_1%==d echo     ��1.������ɫ                  ����ɫ
if %color_1%==D echo     ��1.������ɫ                  ����ɫ
if %color_1%==e echo     ��1.������ɫ                  ����ɫ
if %color_1%==E echo     ��1.������ɫ                  ����ɫ
if %color_1%==f echo     ��1.������ɫ                  ����ɫ
if %color_1%==F echo     ��1.������ɫ                  ����ɫ
if %color_2%==0 echo     ��2.ǰ����ɫ                  ��ɫ
if %color_2%==1 echo     ��2.ǰ����ɫ                  ��ɫ
if %color_2%==2 echo     ��2.ǰ����ɫ                  ��ɫ
if %color_2%==3 echo     ��2.ǰ����ɫ                  ǳ��ɫ
if %color_2%==4 echo     ��2.ǰ����ɫ                  ��ɫ
if %color_2%==5 echo     ��2.ǰ����ɫ                  ��ɫ
if %color_2%==6 echo     ��2.ǰ����ɫ                  ��ɫ
if %color_2%==7 echo     ��2.ǰ����ɫ                  ��ɫ
if %color_2%==8 echo     ��2.ǰ����ɫ                  ��ɫ
if %color_2%==9 echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==a echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==A echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==b echo     ��2.ǰ����ɫ                  ��ǳ��ɫ
if %color_2%==B echo     ��2.ǰ����ɫ                  ��ǳ��ɫ
if %color_2%==c echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==C echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==d echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==D echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==e echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==E echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==f echo     ��2.ǰ����ɫ                  ����ɫ
if %color_2%==F echo     ��2.ǰ����ɫ                  ����ɫ
echo.
if %A_get%==false (
	if %A_get_type%==1 echo     ��3.����ԱȨ�޻�ȡ����          ����һ
	if %A_get_type%==2 echo     ��3.����ԱȨ�޻�ȡ����          ������
	if %A_get_type%==3 echo     ��3.����ԱȨ�޻�ȡ����          ������
	if %A_get_type%==4 echo     ��3.����ԱȨ�޻�ȡ����          ������
	if %A_get_type%==5 echo     ��3.����ԱȨ�޻�ȡ����          ������
	echo     ��4.����ʱ�Զ��������ԱȨ��    ��
	)
if %A_get%==true (
	echo  [-]��3.����ԱȨ�޻�ȡ����          ����һ
	echo     ��4.����ʱ�Զ��������ԱȨ��    ��
	)
echo.
if %function_autogeta%==false echo     ��5.����Ҫʱ�Զ��������ԱȨ��    ��
if %function_autogeta%==true echo     ��5.����Ҫʱ�Զ��������ԱȨ��    ��
if %function_notrtest%==false echo     ��6.����ע�������            ��
if %function_notrtest%==true echo     ��6.����ע�������            ��
echo.
if %command_PowerShell%==true (
	if %Launch_PowerShell%==false echo     ��7.ʹ�� PowerShell ִ�нű�    ��
	if %Launch_PowerShell%==true echo     ��7.ʹ�� PowerShell ִ�нű�    ��
	)
if %command_PowerShell%==false echo  [\]��7.ʹ�� PowerShell ִ�нű�    [δ��⵽]
echo.
echo     ��0.������ݲ��˳��ű�
echo.
echo     ��X.�˳�
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 %site%script\set\set_color_1.bat
if %ERRORLEVEL%==2 %site%script\set\set_color_2.bat
if %ERRORLEVEL%==3 %site%script\set\set_A_get_type.bat
if %ERRORLEVEL%==4 %site%script\set\set_A_get.bat
if %ERRORLEVEL%==5 %site%script\set\set_function_autogeta.bat
if %ERRORLEVEL%==6 %site%script\set\set_function_notrtest.bat
if %command_PowerShell%==true if %ERRORLEVEL%==7 %site%script\set\set_Launch_PowerShell.bat
if %ERRORLEVEL%==10 goto set_deldata
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto set_main

:set_deldata
del /f /s /q %site%data\*
rd /s /q %site%data
exit

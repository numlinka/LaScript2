cls
set completeness=true
set amount=0
echo.
echo ^>^>^>���ڼ��������

::root
::if not exist %site%start.bat ( set completeness=false & set /a amount=%amount%+1 )

::script-root
if not exist %site%script\main_home.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\power_options.bat ( set completeness=false & set /a amount=%amount%+1 )
::��֪������ļ��Ǹ�ʲô�õ� ����ɾ����Ҳ����ûʲô����
::if not exist %site%script\set.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\test.bat ( set completeness=false & set /a amount=%amount%+1 )

::script-A_get
if not exist %site%script\A_get\A_get.bat ( set completeness=false & set /a amount=%amount%+1 )

::script-function
if not exist %site%script\function\advanced_cleanram.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\function\advanced_winactivate.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\function\general_delsystemp.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\function\general_delsystemp_main.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\function\general_IMErepair.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\function\security_closeport_st.bat ( set completeness=false & set /a amount=%amount%+1 )

::script-main
if not exist %site%script\main\main_advanced.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\main\main_general.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\main\main_security.bat ( set completeness=false & set /a amount=%amount%+1 )

::script-set
if not exist %site%script\set\set_A_get.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\set\set_A_get_type.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\set\set_color_1.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\set\set_color_2.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\set\set_main.bat ( set completeness=false & set /a amount=%amount%+1 )

::script-test
if not exist %site%script\test\completeness.bat ( set completeness=false & set /a amount=%amount%+1 )


if %completeness%==true goto over
if %completeness%==false goto error_0

:over
%site%script\main_home.bat
goto error_1
exit

:error_0
mshta vbscript:msgbox("�ű��ļ�������"+vbCrLf+"�� %amount% ���ļ�ȱʧ"+vbCrLf+"�����ļ������ļ����Ƿ񱻸���",48,"LaScript������")(window.close)
exit

:error_1
echo. & echo   δ֪����
mshta vbscript:msgbox("LaScript ������һ��������δ֪����"+vbCrLf+"����϶����� LaScript ������"+vbCrLf+"��˵���ǾͲ���",16,"LaScript������")(window.close)
exit
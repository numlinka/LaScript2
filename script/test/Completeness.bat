cls
set completeness=true
set amount=0
echo.
echo ^>^>^>正在检查完整性

::root
::if not exist %site%start.bat ( set completeness=false & set /a amount=%amount%+1 )

::script-root
if not exist %site%script\main_home.bat ( set completeness=false & set /a amount=%amount%+1 )
if not exist %site%script\power_options.bat ( set completeness=false & set /a amount=%amount%+1 )
::不知道这个文件是干什么用的 但是删掉了也好像没什么问题
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
mshta vbscript:msgbox("脚本文件不完整"+vbCrLf+"有 %amount% 个文件缺失"+vbCrLf+"请检查文件名或文件夹是否被更改",48,"LaScript：警告")(window.close)
exit

:error_1
echo. & echo   未知错误
mshta vbscript:msgbox("LaScript 出现了一个致命的未知错误"+vbCrLf+"但这肯定不是 LaScript 的问题"+vbCrLf+"我说不是就不是",16,"LaScript：错误")(window.close)
exit
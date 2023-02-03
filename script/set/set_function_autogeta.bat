:set_function_autogeta
if %function_autogeta%==false goto start_1
if %function_autogeta%==true goto start_2
goto error_0

:start_1
set function_autogeta=true
echo %function_autogeta% >%site%\data\set\function_autogeta.ini
%site%script\set\set_main.bat
goto errot_1

:start_2
set function_autogeta=false
echo %function_autogeta% >%site%\data\set\function_autogeta.ini
%site%script\set\set_main.bat
goto errot_1

:error_0
set function_autogeta=false
mshta vbscript:msgbox("配置错误  检测到无效配置"+vbCrLf+"已尝试修正",64,"LaSctip：错误")(window.close)
%site%script\set\set_main.bat
goto errot_1

:error_1
mshta vbscript:msgbox("目标文件不存在或已被损坏",16,"LaScript：错误")(window.close)
exit
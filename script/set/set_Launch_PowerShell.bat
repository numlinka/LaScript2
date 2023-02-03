:set_Launch_PowerShell
if %Launch_PowerShell%==false goto start_1
if %Launch_PowerShell%==true goto start_2
goto error_0

:start_1
set Launch_PowerShell=true
echo %Launch_PowerShell% >%site%\data\set\Launch_PowerShell.ini
%site%script\set\set_main.bat
goto errot_1

:start_2
set Launch_PowerShell=false
echo %Launch_PowerShell% >%site%\data\set\Launch_PowerShell.ini
%site%script\set\set_main.bat
goto errot_1

:error_0
set Launch_PowerShell=false
mshta vbscript:msgbox("配置错误  检测到无效配置"+vbCrLf+"已尝试修正",64,"LaSctip：错误")(window.close)
%site%script\set\set_main.bat
goto errot_1

:error_1
mshta vbscript:msgbox("目标文件不存在或已被损坏",16,"LaScript：错误")(window.close)
exit
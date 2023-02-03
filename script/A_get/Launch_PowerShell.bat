:Launch_PowerShell
set /p Launch_PowerShell=<%site%data\set\Launch_PowerShell.ini || set Launch_PowerShell=false
if %Launch_PowerShell%==false goto Launch_PowerShell_false
if %Launch_PowerShell%==true goto Launch_PowerShell_true
if %Launch_PowerShell%==0 goto Launch_PowerShell_false
if %Launch_PowerShell%==1 goto Launch_PowerShell_true

:Launch_PowerShell_false
%site%script\test\Completeness.bat
goto error_0

:Launch_PowerShell_true
set /p Launch_PowerShell_true=<%site%data\temp\Launch_PowerShell_true.ini || set Launch_PowerShell_true=false
if %Launch_PowerShell_true%==true goto Launch_PowerShell_true_true
if %Launch_PowerShell_true%==false goto Launch_PowerShell_true_false
goto Launch_PowerShell_true_true

:Launch_PowerShell_true_true
del %site%data\temp\Launch_PowerShell_true.ini
%site%script\test\Completeness.bat
goto error_0

:Launch_PowerShell_true_false
echo true >%site%data\temp\Launch_PowerShell_true.ini
start PowerShell %site:~0,-1%start.bat"
exit

:error_0
echo. & echo   启动失败：未能找到目标文件
mshta vbscript:msgbox("目标文件不存在或已被损坏",16,"LaScript：错误")(window.close)
exit
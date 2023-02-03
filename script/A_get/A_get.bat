set site=%~dp0
set site=%site:~0,-14%
set /p A_get_type=<%site%data\set\A_get_type.ini || set A_get_type=3
set /p Launch_temp=<%site%data\Launch\Launch.ini || set Launch_temp=0
set site_start=%site%start.bat

if %A_get_type%==1 goto A_get_type_1
if %A_get_type%==2 goto A_get_type_2
if %A_get_type%==3 goto A_get_type_3
if %A_get_type%==4 goto A_get_type_4
if %A_get_type%==5 goto A_get_type_5

:A_get_type_1
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit
%site%start.bat
exit

:A_get_type_2
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
%site%start.bat
exit

:A_get_type_3
echo Set UAC = CreateObject^("Shell.Application"^) > "%site%data\temp\A_get_x%Launch_temp%.vbs"
echo UAC.ShellExecute "%site_start%", "", "", "runas", 1 >> "%site%data\temp\A_get_x%Launch_temp%.vbs"
"%site%data\temp\A_get_x%Launch_temp%.vbs"
exit

:A_get_type_4
echo Set UAC = CreateObject^("Shell.Application"^) > "%site%data\temp\A_get.vbs"
echo UAC.ShellExecute "%site_start%", "", "", "runas", 1 >> "%site%data\temp\A_get.vbs"
"%site%data\temp\A_get.vbs"
exit

:A_get_type_5
runas /noprofile /user:Administrator "%site_start%"
goto A_get_type_5
exit
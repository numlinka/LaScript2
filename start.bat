mode con cols=120 lines=30
echo off
cls
:root

set version_number=147
set version_name=v2.1.0
set version_type=Alpha

title LaScript_%version_name%-%version_type%

echo Deploying...

::脚本文件所在地址
set site="%~dp0"
cd /d %site%

set /p Dev_Opt=<%site%data\set\Dev\Dev_Opt.ini || set Dev_Opt=false
if %Dev_Opt%==false goto Dev_0

set /p Dev_start_time=<%site%data\set\Dev\start_time.ini || set Dev_start_time=false
if %Dev_start_time%==false goto Dev_0
ping 127.1 -n %Dev_start_time% >nul
if %Dev_start_time%==0 ping 127.1 -n %RANDOM:~-1% >nul

:Dev_0
::桌面文件地址
set site_desktop=%SystemDrive%\Users\%username%\Desktop\

::创建数据储存地址
if not exist %site%data md %site%data
if not exist %site%data\Launch md %site%data\Launch
if not exist %site%data\password md %site%data\password
if not exist %site%data\temp md %site%data\temp
if not exist %site%data\set md %site%data\set
if not exist %site%data\diy md %site%data\diy

::管理员权限获取
set /p A_get=<%site%data\set\A_get.ini || set A_get=false

:home_0
::检查管理员权限
rd "%WinDir%\System32\test_permissions" 2>nul
md "%WinDir%\System32\test_permissions" 2>nul && set A_rights=true || set A_rights=false
rd "%WinDir%\System32\test_permissions" 2>nul

if %A_get%==true goto A_get_y
if %A_get%==false goto home_1
if %A_get%==1 ( set A_get=true & goto A_get_y )
if %A_get%==0 ( set A_get=false & goto home_1 )
goto home_1

:A_get_y
if %A_rights%==true goto home_1
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close)&&exit

:home_1
::检查注册表锁定情况
reg query "HKEY_CURRENT_USER" && set R_rights=true || set R_rights=false

::计算启动次数
set /p Launch_temp=<%site%data\Launch\Launch.ini || set Launch_temp=0
set /a Launch=%Launch_temp%+1
echo %Launch% >%site%data\Launch\Launch.ini

::颜色配置
ver|findstr /r /i " [版本 10.0.*]" > NUL || goto home_2
set /p color_1=<%site%data\set\color_1.ini || set color_1=f
set /p color_2=<%site%data\set\color_2.ini || set color_2=0
goto home_3

:home_2
set /p color_1=<%site%data\set\color_1.ini || set color_1=0
set /p color_2=<%site%data\set\color_2.ini || set color_2=f

:home_3
::数据矫正
if %color_1%==0 set color_1=0
if %color_1%==1 set color_1=1
if %color_1%==2 set color_1=2
if %color_1%==3 set color_1=3
if %color_1%==4 set color_1=4
if %color_1%==5 set color_1=5
if %color_1%==6 set color_1=6
if %color_1%==7 set color_1=7
if %color_1%==8 set color_1=8
if %color_1%==9 set color_1=9
if %color_1%==a set color_1=a
if %color_1%==A set color_1=a
if %color_1%==b set color_1=b
if %color_1%==B set color_1=b
if %color_1%==c set color_1=c
if %color_1%==C set color_1=c
if %color_1%==d set color_1=d
if %color_1%==D set color_1=d
if %color_1%==e set color_1=e
if %color_1%==E set color_1=e
if %color_1%==f set color_1=f
if %color_1%==F set color_1=f

if %color_2%==0 set color_2=0
if %color_2%==1 set color_2=1
if %color_2%==2 set color_2=2
if %color_2%==3 set color_2=3
if %color_2%==4 set color_2=4
if %color_2%==5 set color_2=5
if %color_2%==6 set color_2=6
if %color_2%==7 set color_2=7
if %color_2%==8 set color_2=8
if %color_2%==9 set color_2=9
if %color_2%==a set color_2=a
if %color_2%==b set color_2=b
if %color_2%==c set color_2=c
if %color_2%==d set color_2=d
if %color_2%==e set color_2=e
if %color_2%==f set color_2=f
if %color_2%==A set color_2=a
if %color_2%==B set color_2=b
if %color_2%==C set color_2=c
if %color_2%==D set color_2=d
if %color_2%==E set color_2=e
if %color_2%==F set color_2=f

::更改面板颜色
color %color_1%%color_2%

::导入模式配置
set /p mode_compatible=<%site%data\set\mode_compatible.ini || set mode_compatible=false
set /p mode_developer=<%site%data\set\mode_developer.ini || set mode_developer=false
if %mode_compatible%==true if %mode_developer%==true set mode_developer=false

::导入访问密码配置
set /p password=<%site%data\password\password.ini || goto over
set #p=null

:password
cls
echo.
echo     -请输入访问密码:
echo.
set /p #p=password^>
if %#p%==%password% goto over
goto password

:over
set password=
set #p=
%site%script\test.bat
cls
echo 未能执行
mshta vbscript:msgbox("脚本文件不存在或已被损坏",16,"错误：未找到目标文件")(window.close)
exit
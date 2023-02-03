:set_color_1
cls
echo.
if %color_1%==0 echo   [] 选择你想要的背景色        当前：黑色
if %color_1%==1 echo   [] 选择你想要的背景色        当前：蓝色
if %color_1%==2 echo   [] 选择你想要的背景色        当前：绿色
if %color_1%==3 echo   [] 选择你想要的背景色        当前：浅绿色
if %color_1%==4 echo   [] 选择你想要的背景色        当前：红色
if %color_1%==5 echo   [] 选择你想要的背景色        当前：紫色
if %color_1%==6 echo   [] 选择你想要的背景色        当前：黄色
if %color_1%==7 echo   [] 选择你想要的背景色        当前：白色
if %color_1%==8 echo   [] 选择你想要的背景色        当前：灰色
if %color_1%==9 echo   [] 选择你想要的背景色        当前：淡蓝色
if %color_1%==a echo   [] 选择你想要的背景色        当前：淡绿色
if %color_1%==A echo   [] 选择你想要的背景色        当前：淡绿色
if %color_1%==b echo   [] 选择你想要的背景色        当前：淡浅绿色
if %color_1%==B echo   [] 选择你想要的背景色        当前：淡浅绿色
if %color_1%==c echo   [] 选择你想要的背景色        当前：淡红色
if %color_1%==C echo   [] 选择你想要的背景色        当前：淡红色
if %color_1%==d echo   [] 选择你想要的背景色        当前：淡紫色
if %color_1%==D echo   [] 选择你想要的背景色        当前：淡紫色
if %color_1%==e echo   [] 选择你想要的背景色        当前：淡黄色
if %color_1%==E echo   [] 选择你想要的背景色        当前：淡黄色
if %color_1%==f echo   [] 选择你想要的背景色        当前：亮白色
if %color_1%==F echo   [] 选择你想要的背景色        当前：亮白色
if %color_2%==0 echo      选择你想要的前景色        当前：黑色
if %color_2%==1 echo      选择你想要的前景色        当前：蓝色
if %color_2%==2 echo      选择你想要的前景色        当前：绿色
if %color_2%==3 echo      选择你想要的前景色        当前：浅绿色
if %color_2%==4 echo      选择你想要的前景色        当前：红色
if %color_2%==5 echo      选择你想要的前景色        当前：紫色
if %color_2%==6 echo      选择你想要的前景色        当前：黄色
if %color_2%==7 echo      选择你想要的前景色        当前：白色
if %color_2%==8 echo      选择你想要的前景色        当前：灰色
if %color_2%==9 echo      选择你想要的前景色        当前：淡蓝色
if %color_2%==a echo      选择你想要的前景色        当前：淡绿色
if %color_2%==A echo      选择你想要的前景色        当前：淡绿色
if %color_2%==b echo      选择你想要的前景色        当前：淡浅绿色
if %color_2%==B echo      选择你想要的前景色        当前：淡浅绿色
if %color_2%==c echo      选择你想要的前景色        当前：淡红色
if %color_2%==C echo      选择你想要的前景色        当前：淡红色
if %color_2%==d echo      选择你想要的前景色        当前：淡紫色
if %color_2%==D echo      选择你想要的前景色        当前：淡紫色
if %color_2%==e echo      选择你想要的前景色        当前：淡黄色
if %color_2%==E echo      选择你想要的前景色        当前：淡黄色
if %color_2%==f echo      选择你想要的前景色        当前：亮白色
if %color_2%==F echo      选择你想要的前景色        当前：亮白色
echo.
echo    0 = 黑色       8 = 灰色
echo    1 = 蓝色       9 = 淡蓝色
echo    2 = 绿色       A = 淡绿色
echo    3 = 浅绿色     B = 淡浅绿色
echo    4 = 红色       C = 淡红色
echo    5 = 紫色       D = 淡紫色
echo    6 = 黄色       E = 淡黄色
echo    7 = 白色       F = 亮白色
echo.
echo    ·S.交换前景与背景
echo    ·Z.切换
echo    ·X.返回
echo.
choice /c "0123456789abcdefzsx" /n /m ">>>"
set color_0=%color_1%
if %ERRORLEVEL%==1 set color_1=0
if %ERRORLEVEL%==2 set color_1=1
if %ERRORLEVEL%==3 set color_1=2
if %ERRORLEVEL%==4 set color_1=3
if %ERRORLEVEL%==5 set color_1=4
if %ERRORLEVEL%==6 set color_1=5
if %ERRORLEVEL%==7 set color_1=6
if %ERRORLEVEL%==8 set color_1=7
if %ERRORLEVEL%==9 set color_1=8
if %ERRORLEVEL%==10 set color_1=9
if %ERRORLEVEL%==11 set color_1=a
if %ERRORLEVEL%==12 set color_1=b
if %ERRORLEVEL%==13 set color_1=c
if %ERRORLEVEL%==14 set color_1=d
if %ERRORLEVEL%==15 set color_1=e
if %ERRORLEVEL%==16 set color_1=f
if %ERRORLEVEL%==17 %site%script\set\set_color_2.bat
if %ERRORLEVEL%==18 goto set_color_0
if %ERRORLEVEL%==19 %site%script\set\set_main.bat
if %color_1%==%color_2% ( set color_1=%color_0% & goto set_color_1 )
color %color_1%%color_2%
echo %color_1% >%site%data\set\color_1.ini
goto set_color_1

:set_color_0
set color_1=%color_2%
set color_2=%color_0%
color %color_1%%color_2%
echo %color_1% >%site%data\set\color_1.ini
echo %color_2% >%site%data\set\color_2.ini
goto set_color_1
:A_get_type
cls
echo.
echo   [] 管理员权限获取方案
echo.
if %A_get_type%==1 echo     根据不同设备和其兼容性选择最好的方案    当前：方案一
if %A_get_type%==2 echo     根据不同设备和其兼容性选择最好的方案    当前：方案二
if %A_get_type%==3 echo     根据不同设备和其兼容性选择最好的方案    当前：方案三
if %A_get_type%==4 echo     根据不同设备和其兼容性选择最好的方案    当前：方案四
if %A_get_type%==5 echo     根据不同设备和其兼容性选择最好的方案    当前：方案五
echo.
if %A_get%==false echo                                             默认：方案三
if %A_get%==true echo       已启用  启动时自动请求管理员权限      锁定：方案一
echo.
echo     除非你在菜单中选择获取管理员权限时报错  否则不建议修改此项
echo     如果你打开了自动请求管理员权限  那就没必要修改此项
echo.
echo     ·1.方案一 - mshta vbscript
echo.
echo     ·2.方案二 - start mshta vbscript
echo.
echo     ·3.方案三 - new file vbscript
echo.
echo     ·4.方案四 - old file vbscript
echo.
echo     ·5.方案五 - runas (不推荐)
echo.
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 ( set A_get_type=1 & echo 1 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==2 ( set A_get_type=2 & echo 2 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==3 ( set A_get_type=3 & echo 3 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==4 ( set A_get_type=4 & echo 4 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==5 ( set A_get_type=5 & echo 5 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==14 %site%script\set\set_main.bat
goto A_get_type
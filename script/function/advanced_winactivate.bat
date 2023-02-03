echo off
:advanced_winactivate
set step=0
cls
echo.
echo   [] 激活 Windows
echo.
echo    - 请选择你想要激活的版本：
echo.
echo       ·1 - Windows 10 专业版
echo       ·2 - Windows 10 企业版
echo.
echo           - 暂不支持其他版本
echo.
echo           + 如果有条件 请支持正版
echo.
echo       ·X - 返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==14 %site%script\main\main_advanced.bat
set choice=%ERRORLEVEL%
if %choice%==1 goto advanced_winactivate_start
if %choice%==2 goto advanced_winactivate_start
goto advanced_winactivate

:advanced_winactivate_start
cls
set /a step=%step%+1
echo.
if %choice%==1 echo ^>^>^>激活 Windows 10 专业版
if %choice%==2 echo ^>^>^>激活 Windows 10 企业版
echo.
if %step% equ 1 echo   安装产品密匙 替换现有密匙           正在执行...   [ 等待确认 ]
if %step% gtr 1 echo   安装产品密匙 替换现有密匙           已完成
if %step% lss 2 echo   设置 KMS 计算机名称和/或端口        等待
if %step% equ 2 echo   设置 KMS 计算机名称和/或端口        正在执行...   [ 等待确认 ]
if %step% gtr 2 echo   设置 KMS 计算机名称和/或端口        已完成
if %step% lss 3 echo   激活 Windows                        等待
if %step% equ 3 echo   激活 Windows                        正在执行...   [ 等待确认 ]
if %step% gtr 3 echo   激活 Windows                        已完成
if %step% equ 4 ( echo. & echo                                      执行完毕 & slmgr /xpr & goto advanced_winactivate )
if %choice%==1 if %step%==1 slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
if %choice%==2 if %step%==1 slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
if %step%==2 slmgr /skms kms.03k.org
if %step%==3 slmgr /ato
goto advanced_winactivate_start
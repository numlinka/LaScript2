echo off
:general_IMErepair
set step=0
:general_IMErepair_type_1
cls
echo.
echo ^>^>^>�޸� IME �ѽ���
echo.
if %step% equ 1 echo   ֹͣ ���� SysMain                 ִ����...
if %step% gtr 1 echo   ֹͣ ���� SysMain                 �����
if %step% lss 2 echo   ֹͣ ���� Superfetch              �ȴ�
if %step% equ 2 echo   ֹͣ ���� Superfetch              ִ����...
if %step% gtr 2 echo   ֹͣ ���� Superfetch              �����
if %step% lss 3 echo   ���� ���� Schedule                �ȴ�
if %step% equ 3 echo   ���� ���� Schedule                ִ����...
if %step% gtr 3 echo   ���� ���� Schedule                �����
if %step% lss 4 echo   ���� ����ƻ� MsCtfMonitor        �ȴ�
if %step% equ 4 echo   ���� ����ƻ� MsCtfMonitor        ִ����...
if %step% gtr 4 echo   ���� ����ƻ� MsCtfMonitor        �����
if %step% lss 5 echo   ���� ����ƻ� MsCtfMonitor        �ȴ�
if %step% equ 5 echo   ���� ����ƻ� MsCtfMonitor        ִ����...
if %step% gtr 5 echo   ���� ����ƻ� MsCtfMonitor        �����
if %step% lss 6 echo   ���� ���� ChsIME.exe              �ȴ�
if %step% equ 6 echo   ���� ���� ChsIME.exe              ִ����...
if %step% gtr 6 echo   ���� ���� ChsIME.exe              �����
if %step% lss 7 ( echo. & echo. & echo  ������Ϣ�� ) 
if %step% equ 7 (
	echo.
	echo                                    ִ�����
	echo      -�����������-
	pause>nul
	%site%script\main\main_general.bat
	)
if %step%==1 net stop SysMain
if %step%==2 net stop Superfetch
if %step%==3 net Start Schedule
if %step%==4 schtasks /End /TN "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor"
if %step%==5 schtasks /Run /TN "\Microsoft\Windows\TextServicesFramework\MsCtfMonitor"
if %step%==6 taskkill /F /IM ChsIME.exe
set /a step=%step%+1
goto general_IMErepair_type_1
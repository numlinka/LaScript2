echo off
:security_closeport_st
set step=0
:security_closeport_st_type_1
cls
echo.
echo ^>^>^>�ر� 135.137.138.139.445 �˿�
echo.
if %step% equ 1 echo   �ر� 135 �˿�        ִ����...
if %step% gtr 1 echo   �ر� 135 �˿�        ���
if %step% lss 2 echo   �ر� 137 �˿�        �ȴ�
if %step% equ 2 echo   �ر� 137 �˿�        ִ����...
if %step% gtr 2 echo   �ر� 137 �˿�        ���
if %step% lss 3 echo   �ر� 138 �˿�        �ȴ�
if %step% equ 3 echo   �ر� 138 �˿�        ִ����...
if %step% gtr 3 echo   �ر� 138 �˿�        ���
if %step% lss 4 echo   �ر� 139 �˿�        �ȴ�
if %step% equ 4 echo   �ر� 139 �˿�        ִ����...
if %step% gtr 4 echo   �ر� 139 �˿�        ���
if %step% lss 5 echo   �ر� 445 �˿�        �ȴ�
if %step% equ 5 echo   �ر� 445 �˿�        ִ����...
if %step% gtr 5 echo   �ر� 445 �˿�        ���
if %step% lss 6 ( echo. & echo. & echo  ������Ϣ�� ) 
if %step% equ 6 (
	echo.
	echo                      ִ�����
	echo      -�����������-
	pause>nul
	%site%script\main\main_security.bat
	)
if %step%==1 (
	netsh advfirewall firewall add rule name = "Disable port 135 - TCP" dir = in action = block protocol = TCP localport = 135
	netsh advfirewall firewall add rule name = "Disable port 135 - UDP" dir = in action = block protocol = UDP localport = 135
	)
if %step%==2 (
	netsh advfirewall firewall add rule name = "Disable port 137 - TCP" dir = in action = block protocol = TCP localport = 137
	netsh advfirewall firewall add rule name = "Disable port 137 - UDP" dir = in action = block protocol = UDP localport = 137
	)
if %step%==3 (
	netsh advfirewall firewall add rule name = "Disable port 138 - TCP" dir = in action = block protocol = TCP localport = 138
	netsh advfirewall firewall add rule name = "Disable port 138 - UDP" dir = in action = block protocol = UDP localport = 138
	)
if %step%==4 (
	netsh advfirewall firewall add rule name = "Disable port 139 - TCP" dir = in action = block protocol = TCP localport = 139
	netsh advfirewall firewall add rule name = "Disable port 139 - UDP" dir = in action = block protocol = UDP localport = 139
	)
if %step%==5 (
	netsh advfirewall firewall add rule name = "Disable port 445 - TCP" dir = in action = block protocol = TCP localport = 445
	netsh advfirewall firewall add rule name = "Disable port 445 - UDP" dir = in action = block protocol = UDP localport = 445
	)
set /a step=%step%+1
goto security_closeport_st_type_1
mode con COLS=75 LINES=20
if %A_rights%==false title �û���%username%  ^|  LaScript \ general_delsystemp_main - v1.5
if %A_rights%==true title %username%  ^|  LaScript \ general_delsystemp_main - v1.5
echo off
set sch=1
set /p step=<%site%data\temp\step.ini || set step=0
color %color_1%%color_2%
:general_delsystemp_type_1
cls
echo.
echo ^>^>^>����ϵͳ����
echo.
if %step% equ 1 echo   %%systemdrive%%\*.tmp                                            %sch% %%
if %step% gtr 1 echo   %%systemdrive%%\*.tmp                                            �����
if %step% lss 2 echo   %%systemdrive%%\*._mp                                            �ȴ�
if %step% equ 2 echo   %%systemdrive%%\*._mp                                            %sch% %%
if %step% gtr 2 echo   %%systemdrive%%\*._mp                                            �����
if %step% lss 3 echo   %%systemdrive%%\*.log                                            �ȴ�
if %step% equ 3 echo   %%systemdrive%%\*.log                                            %sch% %%
if %step% gtr 3 echo   %%systemdrive%%\*.log                                            �����
if %step% lss 4 echo   %%systemdrive%%\*.gid                                            �ȴ�
if %step% equ 4 echo   %%systemdrive%%\*.gid                                            %sch% %%
if %step% gtr 4 echo   %%systemdrive%%\*.gid                                            �����
if %step% lss 5 echo   %%systemdrive%%\*.chk                                            �ȴ�
if %step% equ 5 echo   %%systemdrive%%\*.chk                                            %sch% %%
if %step% gtr 5 echo   %%systemdrive%%\*.chk                                            �����
if %step% lss 6 echo   %%systemdrive%%\*.old                                            �ȴ�
if %step% equ 6 echo   %%systemdrive%%\*.old                                            %sch% %%
if %step% gtr 6 echo   %%systemdrive%%\*.old                                            �����
if %step% lss 7 echo   %%systemdrive%%\recycled\*                                       �ȴ�
if %step% equ 7 echo   %%systemdrive%%\recycled\*                                       %sch% %%
if %step% gtr 7 echo   %%systemdrive%%\recycled\*                                       �����
if %step% lss 8 echo   %%windir%%\*.bak                                                 �ȴ�
if %step% equ 8 echo   %%windir%%\*.bak                                                 %sch% %%
if %step% gtr 8 echo   %%windir%%\*.bak                                                 �����
if %step% lss 9 echo   %%windir%%\prefetch\*                                            �ȴ�
if %step% equ 9 echo   %%windir%%\prefetch\*                                            %sch% %%
if %step% gtr 9 echo   %%windir%%\prefetch\*                                            �����
if %step% lss 10 echo   %%windir%%\temp\                                                 �ȴ�
if %step% equ 10 echo   %%windir%%\temp\                                                 %sch% %%
if %step% gtr 10 echo   %%windir%%\temp\                                                 �����
if %step% lss 11 echo   %%userprofile%%\cookies\*                                        �ȴ�
if %step% equ 11 echo   %%userprofile%%\cookies\*                                        %sch% %%
if %step% gtr 11 echo   %%userprofile%%\cookies\*                                        �����
if %step% lss 12 echo   %%userprofile%%\recent\*                                         �ȴ�
if %step% equ 12 echo   %%userprofile%%\recent\*                                         %sch% %%
if %step% gtr 12 echo   %%userprofile%%\recent\*                                         �����
if %step% lss 13 echo   %%userprofile%%\Local Settings\Temporary Internet Files\*        �ȴ�
if %step% equ 13 echo   %%userprofile%%\Local Settings\Temporary Internet Files\*        %sch% %%
if %step% gtr 13 echo   %%userprofile%%\Local Settings\Temporary Internet Files\*        �����
if %step% lss 14 echo   %%userprofile%%\Local Settings\Temp\*                            �ȴ�
if %step% equ 14 echo   %%userprofile%%\Local Settings\Temp\*                            %sch% %%
if %step% gtr 14 echo   %%userprofile%%\Local Settings\Temp\*                            �����
if %step% lss 15 echo   %%userprofile%%\recent\*                                         �ȴ�
if %step% equ 15 echo   %%userprofile%%\recent\*                                         %sch% %%
if %step% gtr 15 echo   %%userprofile%%\recent\*                                         �����
if %step% equ 16 exit
:general_delsystemp_type_2
set /p step_temp=<%site%data\temp\step.ini || set step_temp=0
if %step_temp%==%step% (
	ping 127.1 -n 2 >nul
	if %sch% lss 99 set /a sch=%sch%+1
	if %sch%==99 goto general_delsystemp_type_2
	) else (
	set sch=1
	set step=%step_temp%
	)
goto general_delsystemp_type_1
echo off
:advanced_winactivate
set step=0
cls
echo.
echo   [] ���� Windows
echo.
echo    - ��ѡ������Ҫ����İ汾��
echo.
echo       ��1 - Windows 10 רҵ��
echo       ��2 - Windows 10 ��ҵ��
echo.
echo           - �ݲ�֧�������汾
echo.
echo           + ��������� ��֧������
echo.
echo       ��X - ����
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
if %choice%==1 echo ^>^>^>���� Windows 10 רҵ��
if %choice%==2 echo ^>^>^>���� Windows 10 ��ҵ��
echo.
if %step% equ 1 echo   ��װ��Ʒ�ܳ� �滻�����ܳ�           ����ִ��...   [ �ȴ�ȷ�� ]
if %step% gtr 1 echo   ��װ��Ʒ�ܳ� �滻�����ܳ�           �����
if %step% lss 2 echo   ���� KMS ��������ƺ�/��˿�        �ȴ�
if %step% equ 2 echo   ���� KMS ��������ƺ�/��˿�        ����ִ��...   [ �ȴ�ȷ�� ]
if %step% gtr 2 echo   ���� KMS ��������ƺ�/��˿�        �����
if %step% lss 3 echo   ���� Windows                        �ȴ�
if %step% equ 3 echo   ���� Windows                        ����ִ��...   [ �ȴ�ȷ�� ]
if %step% gtr 3 echo   ���� Windows                        �����
if %step% equ 4 ( echo. & echo                                      ִ����� & slmgr /xpr & goto advanced_winactivate )
if %choice%==1 if %step%==1 slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
if %choice%==2 if %step%==1 slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
if %step%==2 slmgr /skms kms.03k.org
if %step%==3 slmgr /ato
goto advanced_winactivate_start
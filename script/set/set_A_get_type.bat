:A_get_type
cls
echo.
echo   [] ����ԱȨ�޻�ȡ����
echo.
if %A_get_type%==1 echo     ���ݲ�ͬ�豸���������ѡ����õķ���    ��ǰ������һ
if %A_get_type%==2 echo     ���ݲ�ͬ�豸���������ѡ����õķ���    ��ǰ��������
if %A_get_type%==3 echo     ���ݲ�ͬ�豸���������ѡ����õķ���    ��ǰ��������
if %A_get_type%==4 echo     ���ݲ�ͬ�豸���������ѡ����õķ���    ��ǰ��������
if %A_get_type%==5 echo     ���ݲ�ͬ�豸���������ѡ����õķ���    ��ǰ��������
echo.
if %A_get%==false echo                                             Ĭ�ϣ�������
if %A_get%==true echo       ������  ����ʱ�Զ��������ԱȨ��      ����������һ
echo.
echo     �������ڲ˵���ѡ���ȡ����ԱȨ��ʱ����  ���򲻽����޸Ĵ���
echo     ���������Զ��������ԱȨ��  �Ǿ�û��Ҫ�޸Ĵ���
echo.
echo     ��1.����һ - mshta vbscript
echo.
echo     ��2.������ - start mshta vbscript
echo.
echo     ��3.������ - new file vbscript
echo.
echo     ��4.������ - old file vbscript
echo.
echo     ��5.������ - runas (���Ƽ�)
echo.
echo     ��X.����
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 ( set A_get_type=1 & echo 1 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==2 ( set A_get_type=2 & echo 2 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==3 ( set A_get_type=3 & echo 3 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==4 ( set A_get_type=4 & echo 4 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==5 ( set A_get_type=5 & echo 5 >%site%data\set\A_get_type.ini )
if %ERRORLEVEL%==14 %site%script\set\set_main.bat
goto A_get_type
:temp_1
cls
echo.
echo   [] ��������
echo.
echo      ˵ʵ��,�������и�������㶼�������������
echo.
set word="exit"
set /p word=������������...��?^>
if %word%=="exit" %site%script\temp\main_temp.bat
if %word%==�������� ( echo. & echo ��������ô��,������ֻ��˵:�������� & pause>nul & goto temp_1 )
start https://www.baidu.com/s?word="%word%"
%0
:temp_1
cls
echo.
echo   [] 上网搜索
echo.
echo      说实话,但凡你有个浏览器你都不会用这玩意儿
echo.
set word="exit"
set /p word=这就是你的搜索...框?^>
if %word%=="exit" %site%script\temp\main_temp.bat
if %word%==迷你世界 ( echo. & echo 不管你怎么想,反正我只会说:辣鸡迷你 & pause>nul & goto temp_1 )
start https://www.baidu.com/s?word="%word%"
%0
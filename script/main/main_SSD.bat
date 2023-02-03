:main_SSD
::reg query "HKEY_CURRENT_USER" && set R_rights=true || set R_rights=false
::if %function_notrtest%==true set R_rights=true
::fsutil behavior query disableDeleteNotify | findstr /r /i "NTFS">%site%data\temp\main_SSD_TRIM_NTFS.ini
::fsutil behavior query disableDeleteNotify | findstr /r /i "ReFS">%site%data\temp\main_SSD_TRIM_ReFS.ini
::findstr /r /i "0" %site%data\temp\main_SSD_TRIM_NTFS.ini
cls
echo.
echo   [] SSD 优化
echo.
fsutil behavior query disableDeleteNotify | findstr /r /i "NTFS" | findstr /r /i "0" >nul && echo     ·1.TRIM 指令 NTFS    关
fsutil behavior query disableDeleteNotify | findstr /r /i "NTFS" | findstr /r /i "1" >nul && echo     ·1.TRIM 指令 NTFS    开
fsutil behavior query disableDeleteNotify | findstr /r /i "ReFS" | findstr /r /i "0" >nul && echo     ·2.TRIM 指令 ReFS    关
fsutil behavior query disableDeleteNotify | findstr /r /i "ReFS" | findstr /r /i "1" >nul && echo     ·2.TRIM 指令 ReFS    开
echo.
echo     ·X.返回
echo.
choice /c "1234567890aszx" /n /m ">>>"
if %ERRORLEVEL%==1 goto start_TRIM_NTFS
if %ERRORLEVEL%==2 goto start_TRIM_RsFS
if %ERRORLEVEL%==14 %site%script\main_home.bat
goto main_SSD

:start_TRIM_NTFS
fsutil behavior query disableDeleteNotify | findstr /r /i "NTFS" | findstr /r /i "0" && fsutil behavior set disableDeleteNotify NTFS 1 && goto main_SSD
fsutil behavior query disableDeleteNotify | findstr /r /i "NTFS" | findstr /r /i "1" && fsutil behavior set disableDeleteNotify NTFS 0 && goto main_SSD
goto main_SSD

:start_TRIM_RsFS
fsutil behavior query disableDeleteNotify | findstr /r /i "ReFS" | findstr /r /i "0" && fsutil behavior set disableDeleteNotify ReFS 1 && goto main_SSD
fsutil behavior query disableDeleteNotify | findstr /r /i "ReFS" | findstr /r /i "1" && fsutil behavior set disableDeleteNotify ReFS 0 && goto main_SSD
goto main_SSD
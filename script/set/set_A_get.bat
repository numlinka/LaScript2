:set_A_get
if %A_get%==true (
	set A_get=false
	echo false >%site%data\set\A_get.ini
	%site%script\set\set_main.bat
	)
if %A_get%==false (
	set A_get=true
	echo true >%site%data\set\A_get.ini
	%site%script\set\set_main.bat
	)
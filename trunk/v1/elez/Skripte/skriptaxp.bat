@ECHO Off
setlocal
set LICSRV=10.20.0.73
set DBNAME=elez
set DBPASS=root
set DBUSER=root
set MYSQL=C:\mysql.exe


%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "DELETE FROM software WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "DELETE FROM machines where machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "SET foreign_key_checks = 0"

REM upis informacija o masini

set z=

for /f "delims=: tokens=2" %%a in ('ipconfig ^| findstr /R /C:"IP Address"') do call :Foo %%a
goto End

:Foo
set z=%z% %1
goto :eof

:End


for /f "delims=" %%i in ('wmic os get Caption ^| findstr "Windows"') do %MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "INSERT INTO machines (machinename,machineos,machineip) VALUES ('%COMPUTERNAME%', '%%i', '%z%')"

%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `machines` SET `machineos` = TRIM( TRAILING '\r' FROM `machineos` ) WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `machines` SET `machineos` = TRIM( TRAILING '\t' FROM `machineos` ) WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `machines` SET `machineos` = TRIM( TRAILING ' ' FROM `machineos` ) WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `machines` SET `machineos` = TRIM(`machineos` ) WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `machines` SET `machineip` = TRIM( TRAILING ' ' FROM `machineip` ) WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `machines` SET `machineip` = TRIM(`machineip` ) WHERE machinename='%COMPUTERNAME%'"

REM upis software-a

for /f "skip=1 delims=" %%i in ('wmic product get Name ^| findstr /v "\n"') do %MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "INSERT INTO software (softwarename,machinename) VALUES ('%%i', '%COMPUTERNAME%')"

REM korekcije

%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `software` SET `softwarename` = TRIM( TRAILING '\r' FROM `softwarename` ) WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `software` SET `softwarename` = TRIM( TRAILING '\t' FROM `softwarename` ) WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `software` SET `softwarename` = TRIM( TRAILING ' ' FROM `softwarename` ) WHERE machinename='%COMPUTERNAME%'"
%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "UPDATE `software` SET `softwarename` = TRIM(`softwarename` ) WHERE machinename='%COMPUTERNAME%'"

%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "DELETE FROM software where machinename='%COMPUTERNAME%' AND softwarename=''"

%MYSQL% -u %DBUSER% -p%DBPASS% -h %LICSRV% %DBNAME% -e "SET foreign_key_checks = 1"

endlocal

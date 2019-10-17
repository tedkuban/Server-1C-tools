@echo off
IF EXIST Server1C-SETTINGS.CMD CALL Server1C-SETTINGS.CMD %1
IF #%NEWVERSION%# == ## Echo Platform version not defined, exiting...
IF #%NEWVERSION%# == ## exit
IF #%PORTPREFIX%# == ## Echo Port prefix not defined, exiting...
IF #%PORTPREFIX%# == ## exit
IF NOT EXIST %SERVERDIR% GoTo CreateDir
Echo Cannot install new server instance in existing directory!
Exit
:CreateDir
ECHO Installing server version %NEWVERSION% with port %PORTPREFIX%40 to %SERVERDIR% directory
MD %SERVERDIR%
icacls %SERVERDIR% /grant %SERVERLOGIN%:(OI)(CI)(M) /inheritance:e
IF NOT EXIST "%ProgramFiles%"\1cv8\current mklink /J "%ProgramFiles%"\1cv8\current "%ProgramFiles%"\1cv8\%NEWVERSION%
rem "%ProgramFiles%"\1cv8\current\bin\ragent.exe -instsrvc -d %SERVERDIR% -debug -usr %SERVERLOGIN% -pwd %SERVERPASSWORD%
mklink /J "%ProgramFiles%"\1cv8\current "%ProgramFiles%"\1cv8\%NEWVERSION%
sc create %SERVICENAME% start= auto binPath= "\"%ProgramFiles%\1cv8\current\bin\ragent.exe\" -d %SERVERDIR% -debug -srvc -agent -port %PORTPREFIX%40 -regport %PORTPREFIX%41 -range %PORTPREFIX%60:%PORTPREFIX%91" DisplayName= %SERVICEDESCR% depend= Tcpip/Dnscache/lanmanworkstation/lanmanserver
sc config %SERVICENAME% obj= %SERVERLOGIN% password= %SERVERPASSWORD%
sc description %SERVICENAME% %SERVICEDESCR%
sc failure %SERVICENAME% reset= INFINITE actions= restart/10000
net start %SERVICENAME%
sc query %SERVICENAME%
ECHO You need to enter setting of one of installed services
ECHO and apply settings, so %SERVERLOGIN% need to be granted
ECHO "Logon as a service" security privilege.
timeout 10

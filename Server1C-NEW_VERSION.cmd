@echo off
IF EXIST Server1C-SETTINGS.CMD CALL Server1C-SETTINGS.CMD %1
IF #%NEWVERSION%# == ## Echo Platform version not defined, exiting...
IF #%NEWVERSION%# == ## exit
IF #%PORTPREFIX%# == ## Echo Port prefix not defined, exiting...
IF #%PORTPREFIX%# == ## exit
REM sc stop "1C:Enterprise 8.3 Server Agent (x86-64)"
REM sc query "1C:Enterprise 8.3 Server Agent (x86-64)"
net stop %RASSERVICENAME%
net stop %SERVICENAME%
rmdir "%PROGRAMDIR%\1cv8\current"
mklink /J "%PROGRAMDIR%\1cv8\current" "%PROGRAMDIR%\1cv8\%NEWVERSION%"
PUSHD "%PROGRAMDIR%\1cv8\current\bin"
start /w cmd.exe /K RegMSC.cmd
regsvr32 -i comcntr.dll
POPD
net start %SERVICENAME%
net start %RASSERVICENAME%
sc query %SERVICENAME%
sc query %RASSERVICENAME%

@echo off
IF EXIST Server1C-SETTINGS.CMD CALL Server1C-SETTINGS.CMD %1
IF #%NEWVERSION%# == ## Echo Platform version not defined, exiting...
IF #%NEWVERSION%# == ## exit
IF #%PORTPREFIX%# == ## Echo Port prefix not defined, exiting...
IF #%PORTPREFIX%# == ## exit
rem net stop "1C:Enterprise 8.3 Server Agent (x86-64)"
rem sc delete "1C:Enterprise 8.3 Server Agent (x86-64)"
net stop %SERVICENAME%
timeout 10
sc delete %SERVICENAME%

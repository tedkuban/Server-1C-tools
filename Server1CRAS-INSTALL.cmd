@echo off
IF EXIST Server1C-SETTINGS.CMD CALL Server1C-SETTINGS.CMD %1
IF #%PORTPREFIX%# == ## Echo Port prefix not defined, exiting...
IF #%PORTPREFIX%# == ## exit
mklink /J "%ProgramFiles%"\1cv8\current "%ProgramFiles%"\1cv8\%NEWVERSION%
rem REM net start "1C:8 Remote Administration Server"
rem %1 - полный номер версии 1С:Предприятия
rem set SrvUserName=<имя пользователя>
rem set SrvUserPwd=<пароль пользователя>
rem set CtrlPort=1540
rem set AgentName=localhost
rem set RASPort=1545
rem set SrvcName="1C:Enterprise 8.3 Remote Server"
rem set BinPath="\"C:\Program Files\1cv8\%1\bin\ras.exe\" cluster --service --port=%RASPort% %AgentName%:%CtrlPort%"
rem set Desctiption="Сервер администрирования 1С:Предприятия 8.3"
rem sc stop %SrvcName%
rem sc delete %SrvcName%
rem sc create %SrvcName% binPath= %BinPath% start= auto obj= %SrvUserName% password= %SrvUserPwd% displayname= %Desctiption%
sc create %RASSERVICENAME% binpath= "\"%ProgramFiles%\1cv8\current\bin\ras.exe\" --service --port=%PORTPREFIX%45 cluster localhost:%PORTPREFIX%40" displayname= %RASSERVICEDESCR% start= auto obj= %SERVERLOGIN% password= %SERVERPASSWORD%
net start %RASSERVICENAME%
sc query %RASSERVICENAME%

@echo off
IF EXIST Server1C-SETTINGS.CMD CALL Server1C-SETTINGS.CMD %1
IF #%PORTPREFIX%# == ## Echo Port prefix not defined, exiting...
IF #%PORTPREFIX%# == ## exit
mklink /J "%PROGRAMDIR%\1cv8\current" "%PROGRAMDIR%\1cv8\%NEWVERSION%"
rem REM net start "1C:8 Remote Administration Server"
rem %1 - ����� ����� ���ᨨ 1�:�।�����
rem set SrvUserName=<��� ���짮��⥫�>
rem set SrvUserPwd=<��஫� ���짮��⥫�>
rem set CtrlPort=1540
rem set AgentName=localhost
rem set RASPort=1545
rem set SrvcName="1C:Enterprise 8.3 Remote Server"
rem set BinPath="\"%PROGRAMDIR%\1cv8\%1\bin\ras.exe\" cluster --service --port=%RASPort% %AgentName%:%CtrlPort%"
rem set Desctiption="��ࢥ� ���������஢���� 1�:�।����� 8.3"
rem sc stop %SrvcName%
rem sc delete %SrvcName%
rem sc create %SrvcName% binPath= %BinPath% start= auto obj= %SrvUserName% password= %SrvUserPwd% displayname= %Desctiption%
sc create %RASSERVICENAME% binpath= "\"%PROGRAMDIR%\1cv8\current\bin\ras.exe\" --service --port=%PORTPREFIX%45 cluster localhost:%PORTPREFIX%40" displayname= %RASSERVICEDESCR% start= auto obj= %SERVERLOGIN% password= %SERVERPASSWORD%
sc config %RASSERVICENAME% depend= %SERVICENAME%
sc failure %RASSERVICENAME% reset= INFINITE actions= restart/10000
net start %RASSERVICENAME%
sc query %RASSERVICENAME%

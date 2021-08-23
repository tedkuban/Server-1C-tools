rem @echo off
SET NEWVERSION=8.3.19.1264
SET PORTPREFIX=15
REM SET INSTALLARCH=x86
SET INSTALLARCH=x64

SET SERVERDIR="C:\V8SRVDATA"
REM SET SERVERDIR="%PROGRAMDIR%\1cv8\srvinfo"
  REM SET SERVERLOGIN=".\srv1cv8" Don't use dot for local computer account!
  REM SET SERVERLOGIN="%COMPUTERNAME%\srv1cv8" Use computer name with username
SET SERVERLOGIN="%USERDOMAIN%\server1c"
REM Put password in any file then type filename in string below
@FOR /F "usebackq" %%i in ("\\%USERDOMAIN%\NETLOGON\sysadmin\server1c.txt") do SET SERVERPASSWORD="%%i"
REM Put password here if the secret password file is not used
IF #%SERVERPASSWORD%# == ## SET SERVERPASSWORD="password"
REM SET ALWAYS_USE_PORT_PREFIX="false"
SET ALWAYS_USE_PORT_PREFIX="true"

REM Edit only settings above !

IF NOT #%1# == ## SET PORTPREFIX=%1

SET PROGRAMDIR=%ProgramFiles%
IF #%INSTALLARCH%# == #x86# SET PROGRAMDIR=%ProgramFiles(x86)%
SET NAMESUFFIX= (x86-64)
IF #%INSTALLARCH%# == #x86# SET NAMESUFFIX=
SET NAMESUFFIX1C=%NAMESUFFIX%
SET NAMESUFFIXRAS=%NAMESUFFIX%
REM 15 is the default port prefix (1C server use ports 1540, 1541, 1516-1591, RAS use port 1545)
IF #%PORTPREFIX%# == #15# IF NOT #%ALWAYS_USE_PORT_PREFIX%# == #"true"# GoTo setnames
SET NAMESUFFIX1C=%NAMESUFFIX% %PORTPREFIX%40
SET NAMESUFFIXRAS=%NAMESUFFIX% %PORTPREFIX%45

:setnames
SET SERVICENAME="1C:Enterprise 8.3 Server Agent%NAMESUFFIX1C%"
SET SERVICEDESCR="Агент сервера 1С:Предприятия 8.3%NAMESUFFIX1C%"
SET RASSERVICENAME="1C:Enterprise 8.3 Remote Server%NAMESUFFIXRAS%"
SET RASSERVICEDESCR="Сервер администрирования 1С:Предприятия 8.3%NAMESUFFIXRAS%"

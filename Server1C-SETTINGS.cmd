rem @echo off
SET NEWVERSION=8.3.16.1148
SET PORTPREFIX=15
REM SET INSTALLARCH=x86
SET INSTALLARCH=x64

IF NOT #%1# == ## SET PORTPREFIX=%1

SET PROGRAMDIR=%ProgramFiles%
IF #%INSTALLARCH%# == #x86# SET PROGRAMDIR=%ProgramFiles(x86)%
SET NAMESUFFIX= (x86-64)
IF #%INSTALLARCH%# == #x86# SET NAMESUFFIX=

SET SERVERDIR="C:\V8SRVDATA"
REM SET SERVERDIR="%PROGRAMDIR%\1cv8\srvinfo"

            REM SET SERVERLOGIN=".\srv1cv8" Don't use dot for local computer account!
            REM SET SERVERLOGIN="%COMPUTERNAME%\srv1cv8" Use computer name with username
SET SERVERLOGIN="%USERDOMAIN%\srv1cv8"
REM Put password in any file then type filename in ctring below
@FOR /F %%i in (C:\admin\server1c.txt) do SET SERVERPASSWORD="%%i"
IF #%SERVERPASSWORD%# == ## SET SERVERPASSWORD="password"

SET SERVICENAME="1C:Enterprise 8.3 Server Agent%NAMESUFFIX% %PORTPREFIX%40"
SET SERVICEDESCR="Агент сервера 1С:Предприятия 8.3%NAMESUFFIX% %PORTPREFIX%40"
SET RASSERVICENAME="1C:Enterprise 8.3 Remote Server%NAMESUFFIX% %PORTPREFIX%45"
SET RASSERVICEDESCR="Сервер администрирования 1С:Предприятия 8.3%NAMESUFFIX% %PORTPREFIX%45"
rem Для HS1 убрать следующий REM
rem GoTo return
IF #%PORTPREFIX%# == #15# SET SERVICENAME="1C:Enterprise 8.3 Server Agent%NAMESUFFIX%"
IF #%PORTPREFIX%# == #15# SET SERVICEDESCR="Агент сервера 1С:Предприятия 8.3%NAMESUFFIX%"
IF #%PORTPREFIX%# == #15# SET RASSERVICENAME="1C:Enterprise 8.3 Remote Server%NAMESUFFIX%"
IF #%PORTPREFIX%# == #15# SET RASSERVICEDESCR="Сервер администрирования 1С:Предприятия 8.3%NAMESUFFIX%"
:return

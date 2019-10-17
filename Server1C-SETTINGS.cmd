rem @echo off
SET NEWVERSION=8.3.13.1644
SET PORTPREFIX=15
IF NOT #%1# == ## SET PORTPREFIX=%1
REM    SET SERVERDIR="C:\V8SRVDATA"
SET SERVERDIR="C:\Program Files\1cv8\srvinfo"
            REM SET SERVERLOGIN=".\srv1cv8" Don't use dot to use local computer account!
REM SET SERVERLOGIN="%DOMAINNAME%\srv1cv8"
SET SERVERLOGIN="HAPPYLOOK\server1c"
@FOR /F %%i in (\\happylook\netlogon\sysadmin\server1c.txt) do SET SERVERPASSWORD="%%i"
IF #%SERVERPASSWORD%# == ## SET SERVERPASSWORD="password"
SET SERVICENAME="1C:Enterprise 8.3 Server Agent %PORTPREFIX%40 (x86-64)"
SET SERVICEDESCR="Агент сервера 1С:Предприятия 8.3 %PORTPREFIX%40 (x86-64)"
SET RASSERVICENAME="1C:Enterprise 8.3 Remote Server %PORTPREFIX%45"
SET RASSERVICEDESCR="Сервер администрирования 1С:Предприятия 8.3 %PORTPREFIX%45"
rem Для HS1 убрать следующий REM
rem GoTo return
IF #%PORTPREFIX%# == #15# SET SERVICENAME="1C:Enterprise 8.3 Server Agent (x86-64)"
IF #%PORTPREFIX%# == #15# SET SERVICEDESCR="Агент сервера 1С:Предприятия 8.3 (x86-64)"
IF #%PORTPREFIX%# == #15# SET RASSERVICENAME="1C:Enterprise 8.3 Remote Server"
IF #%PORTPREFIX%# == #15# SET RASSERVICEDESCR="Сервер администрирования 1С:Предприятия 8.3"
:return

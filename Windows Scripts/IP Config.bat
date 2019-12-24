::Run with Admin Privilege

@ECHO off
cls
:start

ECHO.
ECHO 1. Static Connection 1
ECHO 2. DHCP Connection
ECHO 3. Exit
ECHO.
set choice=
set /p choice=Select Number:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto con2
if '%choice%'=='3' goto exit

ECHO "%choice%" is not valid, try again
ECHO.
goto start

:con1
ECHO Static Connection 1
netsh int ipv4 set address "Local Area Connection" static 192.168.1.2 255.255.255.0 192.168.1.1
netsh int ipv4 add dnsserver "Local Area Connection" address=8.8.8.8 index=1
netsh int ipv4 add dnsserver "Local Area Connection" address=8.8.4.4 index=2
goto end

:con2
ECHO DHCP Connection
netsh int ipv4 set address "Local Area Connection" dhcp
netsh int ipv4 set dns "Local Area Connection" dhcp
goto end

:end
pause
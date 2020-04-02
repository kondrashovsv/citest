@echo off

REM set filename
set fnlog="log.txt"

REM "HOSTNAME:"
echo Host name: %COMPUTERNAME%  >  %fnlog%

REM "OS"
for /f "delims=" %%i in ('
	WMIC OS GET Caption^,Version^,OSArchitecture ^|FINDSTR /I /V "Caption" ^|FINDSTR /VIRC:"^$"
') do set os_version=%%i
echo OS version: %os_version% >> %fnlog%

REM "CPU CORES"
for /f "tokens=1-2" %%a in ('
	WMIC COMPUTERSYSTEM GET NumberOfLogicalProcessors^,TotalPhysicalMemory ^| FINDSTR /VI "NumberOfLogicalProcessors" ^| FINDSTR /VIRC:"^$"
') do @echo wsh.echo "CPU cores: " ^& %%a > %temp%\tmp.vbs & @echo( & @cscript //nologo %temp%\tmp.vbs >> %fnlog% & del %temp%\tmp.vbs

REM "RAM:"
for /f "tokens=1-2" %%a in ('
	WMIC COMPUTERSYSTEM GET NumberOfLogicalProcessors^,TotalPhysicalMemory ^| FINDSTR /VI "NumberOfLogicalProcessors" ^| FINDSTR /VIRC":^$"
') do @echo wsh.echo "RAM: " ^& FormatNumber^(cdbl^(%%b^)/1024/1024/1024, 2^) ^& " GiB"  > %temp%\tmp.vbs & @echo( & @cscript //nologo %temp%\tmp.vbs >> %fnlog% & del %temp%\tmp.vbs

REM "HDD SIZE:"
for /f "tokens=1-3" %%a in ('
	WMIC LOGICALDISK GET FreeSpace^,Name^,Size ^|FINDSTR /I /V "Name" ^| FINDSTR "C:"
') do @echo wsh.echo "HDD size: " ^& FormatNumber^(cdbl^(%%c^)/1024/1024/1024, 2^)^& " GiB" > %temp%\tmp.vbs & @echo( & @cscript //nologo %temp%\tmp.vbs >> %fnlog% & del %temp%\tmp.vbs

REM "HDD SIZE:"
for /f "tokens=1-3" %%a in ('
	WMIC LOGICALDISK GET FreeSpace^,Name^,Size ^|FINDSTR /I /V "Name" ^| FINDSTR "C:"
') do @echo wsh.echo "HDD disk usage: " ^& FormatNumber^(cdbl^(%%c^-%%a^)/1024/1024/1024, 2^)^& " GiB" > %temp%\tmp.vbs & @echo( & @cscript //nologo %temp%\tmp.vbs >> %fnlog% & del %temp%\tmp.vbs

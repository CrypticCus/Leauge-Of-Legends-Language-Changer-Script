:: Starting Parameters
@echo off & color a & chcp 1254 & mode con: cols=70 lines=7 & title League Of Legends Language Changer & setlocal enabledelayedexpansion & cls
SET "T_Reset=[0m" & SET "T_Bold=[1m"&SET "T_UnderLine=[4m"&SET "T_Inverse=[7m"&SET "C_Red=[91;40m"&SET "C_Green=[92;40m"&SET "C_Yellow=[93;40m"&SET "C_Blue=[94;40m"&SET "C_Magenta=[95;40m"&SET "C_Cyan=[96;40m"&SET "C_White=[97;40m"

:: Run As Administrator
>nul reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\" &call \"%%2\" %%3" &set _= %*
>nul fltmc || if "%f0%" neq "%~f0" ( cd.>"%tmp%\runas.Admin" &start "%~n0" /high "%tmp%\runas.Admin" "%~f0" "%_:"=""%" &exit /b )


:: Set Shortcut Name
Set FileName=League of Legends Language Changer


:: Override Options (Remove "::" & Edit "Path")
:: Set LOL_Location="Path\Riot Games\League of Legends\LeagueClient.exe"
:: Goto Skip


:: Path Finder
MD %temp%\LOLLanguageChanger > NUL 2>&1
DEL /F /Q /A "%temp%\LOLLanguageChanger\Disk" > NUL 2>&1
DEL /F /Q /A "%temp%\LOLLanguageChanger\Number" > NUL 2>&1
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E#&echo on&for %%b in (1) do rem"') do (set R=%%b)
set Error=0
chcp 437 > NUL
for /f "skip=3 tokens=1 delims= " %%a in ('Powershell -command "Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID"') do (
	chcp 65001 > NUL
	echo Disk = %%a >> %temp%\LOLLanguageChanger\Disk
)
cls
echo.
echo  %C_Red%Searching League of Legends Location%C_Green%
set Number=0
echo.
FOR /F "tokens=3" %%a in ('Findstr /i "Disk" %temp%\LOLLanguageChanger\Disk 2^>NUL') do (
	FOR /F "tokens=*" %%b in ('dir /b /s %%a\*LeagueClient.exe 2^>NUL') do (
		set /a Number+=1
		echo   %R%[32m!Number!-%R%[33m "%%b"%R%[0m
		echo [LOL_!Number!]=%%b >> %temp%\LOLLanguageChanger\Number
	)
)
Findstr /i "[LOL_1]" %temp%\LOLLanguageChanger\Number > NUL 2>&1
	if %errorlevel% NEQ 0 (echo %R%[31m League of Legends is not installed%R%[0m
						   set Error=1)
echo.
set /p Value=►%R%[32m Select Location: %R%[0m
	if %Error% EQU 1 (goto LOL_Location)
FOR /F "delims='=' tokens=2" %%g in ('findstr /i "LOL_%Value%" %temp%\LOLLanguageChanger\Number') do (set LOL_Location=%%g)


:Skip
:: Kill & Clean
taskkill /F /IM "LeagueClientUx.exe" >NUL 2>&1
taskkill /F /IM "LeagueClientServices.exe" >NUL 2>&1
taskkill /F /IM "LeagueClientUxRender.exe" >NUL 2>&1
taskkill /F /IM "LeagueCrashHandler64.exe" >NUL 2>&1
taskkill /F /IM "RiotClientUx.exe" >NUL 2>&1
taskkill /F /IM "RiotClientServices.exe" >NUL 2>&1
taskkill /F /IM "RiotClientUxRender.exe" >NUL 2>&1
taskkill /F /IM "RiotClientCrashHandler.exe" >NUL 2>&1
DEL /F /S /Q "%USERPROFILE%\Desktop\%FileName%.lnk" >Nul 2>&1
DEL /F /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Riot Games\%FileName%.lnk" >Nul 2>&1


:: League Of Legends Language Changer
:Language
mode con: cols=40 lines=28 & cls
echo.
echo    %C_Red%League of Legends Language Changer%C_Green%
echo.
echo %C_Red%1)%C_Green%  Brazil
echo %C_Red%2)%C_Green%  Chinese (China)
echo %C_Red%3)%C_Green%  Chinese (Taiwan)
echo %C_Red%4)%C_Green%  Czech Republic
echo %C_Red%5)%C_Green%  English
echo %C_Red%6)%C_Green%  France
echo %C_Red%7)%C_Green%  Germany
echo %C_Red%8)%C_Green%  Greece
echo %C_Red%9)%C_Green%  Hungary
echo %C_Red%10)%C_Green% Indonesia
echo %C_Red%11)%C_Green% Italy
echo %C_Red%12)%C_Green% Japan
echo %C_Red%13)%C_Green% Korea
echo %C_Red%14)%C_Green% Malaysia (Chinese)
echo %C_Red%15)%C_Green% Malaysia
echo %C_Red%16)%C_Green% Mexico (Spanish)
echo %C_Red%17)%C_Green% Poland
echo %C_Red%18)%C_Green% Romania
echo %C_Red%19)%C_Green% Russian
echo %C_Red%20)%C_Green% Spanish
echo %C_Red%21)%C_Green% Thailand
echo %C_Red%22)%C_Green% Turkey
echo %C_Red%23)%C_Green% Vietnam
echo.
Set Lang=
Set /P Lang= Language Preferance: 


:: Set Parameters
if %Lang%==1 set lang=pt_BR & goto :Continue
if %Lang%==2 set lang=zh_CN & goto :Continue
if %Lang%==3 set lang=zh_TW & goto :Continue
if %Lang%==4 set lang=cs_CZ & goto :Continue
if %Lang%==5 set lang=en_US & goto :Continue
if %Lang%==6 set lang=fr_FR & goto :Continue
if %Lang%==7 set lang=de_DE & goto :Continue
if %Lang%==8 set lang=el_GR & goto :Continue
if %Lang%==9 set lang=hu_HU & goto :Continue
if %Lang%==10 set lang=id_ID & goto :Continue
if %Lang%==11 set lang=it_IT & goto :Continue
if %Lang%==12 set lang=ja_JP & goto :Continue
if %Lang%==13 set lang=ko_KR & goto :Continue
if %Lang%==14 set lang=zh_MY & goto :Continue
if %Lang%==15 set lang=ms_MY & goto :Continue
if %Lang%==16 set lang=es_MX & goto :Continue
if %Lang%==17 set lang=pl_PL & goto :Continue
if %Lang%==18 set lang=ro_RO & goto :Continue
if %Lang%==19 set lang=ru_RU & goto :Continue
if %Lang%==20 set lang=es_ES & goto :Continue
if %Lang%==21 set lang=th_TH & goto :Continue
if %Lang%==22 set lang=tr_TR & goto :Continue
if %Lang%==23 set lang=vn_VN & goto :Continue
cls & mode con: cols=40 lines=3
echo.
echo    %C_Red%Invalid Language, Please Try Again%C_Green%
ping 127.0.0.1 -n 3 >Nul 2>&1 & cls
goto :Language


:Continue
:: Create VBS Script
set SCRIPT="%TEMP%\%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\%FileName%.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%LOL_Location%" >> %SCRIPT%
echo oLink.Arguments = "--locale=%lang%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%


:: Shortcut Settings
attrib +R "%USERPROFILE%\Desktop\%FileName%.lnk" >Nul 2>&1
xcopy "%USERPROFILE%\Desktop\%FileName%.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Riot Games\" /Y /K /R /S /H /i >Nul 2>&1


:: Start League of Legends
cls & mode con: cols=40 lines=4
cls
echo.
echo        New Icon Added To Desktop
echo       Launching League of Legends
"%LOL_Location:~0,-1%" --locale=%lang%
:: start "" "%USERPROFILE%\Desktop\%FileName%.lnk"
:: start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Riot Games\%FileName%.lnk"
ping 127.0.0.1 -n 3 >Nul 2>&1
cls & exit

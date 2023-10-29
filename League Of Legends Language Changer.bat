:: Starting Parameters
@echo off & color a & chcp 1254 & mode con: cols=70 lines=7 & title League Of Legends Language Changer & setlocal enabledelayedexpansion & cls
SET liveincolor=1 & SET "c_underline=[4m" & SET "c_reset=[0m" & SET "c_Red_Blak=[91;40m" & SET "c_Gre_Blak=[92;40m" & SET "c_Yel_Blak=[93;40m" & SET "c_Blu_Blak=[94;40m" & SET "c_Mag_Blak=[95;40m" & SET "c_Cya_Blak=[96;40m" & SET "c_Whi_Blak=[97;40m"

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
echo  %c_Red_Blak%Searching League of Legends Location%c_Gre_Blak%
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
echo    %c_Red_Blak%League of Legends Language Changer%c_Gre_Blak%
echo.
echo %c_Red_Blak%1)%c_Gre_Blak%  Brazil
echo %c_Red_Blak%2)%c_Gre_Blak%  Chinese (China)
echo %c_Red_Blak%3)%c_Gre_Blak%  Chinese (Taiwan)
echo %c_Red_Blak%4)%c_Gre_Blak%  Czech Republic
echo %c_Red_Blak%5)%c_Gre_Blak%  English
echo %c_Red_Blak%6)%c_Gre_Blak%  France
echo %c_Red_Blak%7)%c_Gre_Blak%  Germany
echo %c_Red_Blak%8)%c_Gre_Blak%  Greece
echo %c_Red_Blak%9)%c_Gre_Blak%  Hungary
echo %c_Red_Blak%10)%c_Gre_Blak% Indonesia
echo %c_Red_Blak%11)%c_Gre_Blak% Italy
echo %c_Red_Blak%12)%c_Gre_Blak% Japan
echo %c_Red_Blak%13)%c_Gre_Blak% Korea
echo %c_Red_Blak%14)%c_Gre_Blak% Malaysia (Chinese)
echo %c_Red_Blak%15)%c_Gre_Blak% Malaysia
echo %c_Red_Blak%16)%c_Gre_Blak% Mexico (Spanish)
echo %c_Red_Blak%17)%c_Gre_Blak% Poland
echo %c_Red_Blak%18)%c_Gre_Blak% Romania
echo %c_Red_Blak%19)%c_Gre_Blak% Russian
echo %c_Red_Blak%20)%c_Gre_Blak% Spanish
echo %c_Red_Blak%21)%c_Gre_Blak% Thailand
echo %c_Red_Blak%22)%c_Gre_Blak% Turkey
echo %c_Red_Blak%23)%c_Gre_Blak% Vietnam
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
echo    %c_Red_Blak%Invalid Language, Please Try Again%c_Gre_Blak%
ping 127.0.0.1 -n 3 >Nul 2>&1 & cls
goto :Language


:Continue
:: Create VBS Script
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
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
@echo off
title Garry's Mod Content installer 3.1 by z0mbieslayer
IF EXIST "updatertmp.exe" (
	del updatertmp.exe
)
echo Searching for updates...
powershell -Command "Invoke-WebRequest "http://z0mbieslayer.ddns.net/gmodcontent/3.1/tmp.txt -OutFile tmp.txt"
PING -n 4 127.0.0.1>nul
setlocal EnableExtensions EnableDelayedExpansion
for /f "delims=" %%a in (tmp.txt) do (
set /a c+=1
set x[!c!]=%%a
)
set x
IF "%x[1]%"=="update=true" (
	del tmp.txt
	echo Update found, downloading new update...
	powershell -Command "Invoke-WebRequest "http://z0mbieslayer.ddns.net/gmodcontent/Garrys_Mod_Content_installer.exe -OutFile Garrys_Mod_Content_installer.exe.tmp"
	echo Starting external updater...
	powershell -Command "Invoke-WebRequest "http://z0mbieslayer.ddns.net/gmodcontent/updatertmp.exe -OutFile updatertmp.exe"
	PING -n 4 127.0.0.1>nul
	start updatertmp.exe
	exit
)
IF "%x[1]%"=="update=false" (
	del tmp.txt
	echo No update found, starting content installer...
	PING -n 4 127.0.0.1>nul
	cls
)
:start
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
echo 1 - Attempt to automatically find Garry's Mod directory
echo 2 - Specify Garry's Mod directory manually
echo 3 - Install a custom addon (Steam Workshop) (Beta)
echo 4 - About
echo 5 - Exit
set /p option=What would you like to do? (1-5): 
IF "%option%"=="1" (
	cls
	goto auto
)
IF "%option%"=="2" (
	cls
	goto man
)
IF "%option%"=="3" (
	cls
	goto custom
)
IF "%option%"=="4" (
	cls
	goto about
)
IF "%option%"=="5" (
	exit
)
cls
goto start
:about
echo This project was created over the span of a few days, in effort to automate the process of installing Garry's Mod
echo content from Valve games without owning the games. I mainly made this project to better myself in programming. I ran
echo into a ton of problems over the course of making this, but every bug I found was able to be patched, and a new update
echo would be released. I am proud of the outcome of this application, and I am glad I took on this challenge. 
echo 											-March 30, 2020
pause
cls
goto start
:auto
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
echo Trying to find directory automatically...
set autopath=C:\progra~2\Steam\steamapps\common\GarrysMod
PING -n 4 127.0.0.1>nul
IF EXIST "%autopath%" ( 
	echo Found Garry's Mod installation directory. Moving to new directory
	PING -n 4 127.0.0.1>nul
	cd "%autopath%"
	cd garrysmod
	cd addons
	goto autostart
) ELSE (
	echo Couldn't find directory
	PING -n 4 127.0.0.1>nul
	cls
	goto start
)
:man
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
set /p dir=Input your Garry's Mod installation directory: 
IF EXIST "%dir%/garrysmod/" ( 
	echo Moving to new directory
	goto manstart
) ELSE (
	echo Not a valid Garry's Mod directory
	PING -n 4 127.0.0.1>nul
	cls
	goto start
)
:manstart
PING -n 4 127.0.0.1>nul
cd %dir%
cd garrysmod
cd addons
IF EXIST "%dir%\garrysmod\addons\CSSContent" (
	set opt=*Installed*
)
IF EXIST "%dir%\garrysmod\addons\HL2EP1Content" (
	set opt2=*Installed*
)
IF EXIST "%dir%\garrysmod\addons\HL2EP2Content" (
	set opt3=*Installed*
)
IF EXIST "%dir%\garrysmod\addons\TF2Content" (
	set opt4=*Installed*
)
IF EXIST "%dir%\garrysmod\addons\L4D2Content" (
	set opt5=*Installed*
)
IF EXIST "%dir%\garrysmod\addons\PortalContent" (
	set opt6=*Installed*
)
IF EXIST "%dir%\garrysmod\addons\Portal2Content" (
	set opt7=*Installed*
)
:autostart
IF EXIST "%autopath%\garrysmod\addons\CSSContent" (
	set opt=*Installed*
)
IF EXIST "%autopath%\garrysmod\addons\HL2EP1Content" (
	set opt2=*Installed*
)
IF EXIST "%autopath%\garrysmod\addons\HL2EP2Content" (
	set opt3=*Installed*
)
IF EXIST "%autopath%\garrysmod\addons\TF2Content" (
	set opt4=*Installed*
)
IF EXIST "%autopath%\garrysmod\addons\L4D2Content" (
	set opt5=*Installed*
)
IF EXIST "%autopath%\garrysmod\addons\PortalContent" (
	set opt6=*Installed*
)
IF EXIST "%autopath%\garrysmod\addons\Portal2Content" (
	set opt7=*Installed*
)
echo Moved to new directory
PING -n 4 127.0.0.1>nul
cls
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
echo 1 - CSSContent %opt%
echo 2 - HL2 EP1 %opt2%
echo 3 - HL2 EP2 %opt3%
echo 4 - TF2 %opt4%
echo 5 - L4D2 %opt5%
echo 6 - Portal %opt6%
echo 7 - Portal 2 %opt7%
set /p addon=What content would you like to install? (1-7): 
	IF "%addon%"=="1" (
		echo Downloading CSSContent...This may take awhile...
		powershell -Command "Invoke-WebRequest http://z0mbieslayer.ddns.net/gmodcontent/CSSContent.zip -OutFile CSSContent.zip"
		echo Finished Downloading CSSContent.zip
		PING -n 4 127.0.0.1>nul
		echo Extracting CSSContent...
		powershell Expand-Archive CSSContent.zip -DestinationPath CSSContent
		echo Deleting Temporary Files...
		del "CSSContent.zip"
		PING -n 4 127.0.0.1>nul
		echo CSSContent successfully installed. Restart Garry's Mod for changes to take place.
		pause
		exit
	)
	IF "%addon%"=="2" (
		echo Downloading HL2EP1Content...This may take awhile...
		powershell -Command "Invoke-WebRequest http://z0mbieslayer.ddns.net/gmodcontent/HL2EP1Content.zip -OutFile HL2EP1Content.zip"
		echo Finished Downloading HL2EP1Content.zip
		PING -n 4 127.0.0.1>nul
		echo Extracting HL2EP1Content...
		powershell Expand-Archive HL2EP1Content.zip -DestinationPath HL2EP1Content
		echo Deleting Temporary Files...
		del "HL2EP1Content.zip"
		PING -n 4 127.0.0.1>nul
		echo HL2EP1Content successfully installed. Restart Garry's Mod for changes to take place.
		pause
		exit
	)
	IF "%addon%"=="3" (
		echo Downloading HL2EP2Content...This may take awhile...
		powershell -Command "Invoke-WebRequest http://z0mbieslayer.ddns.net/gmodcontent/HL2EP2Content.zip -OutFile HL2EP2Content.zip"
		echo Finished Downloading HL2EP2Content.zip
		PING -n 4 127.0.0.1>nul
		echo Extracting HL2EP2Content...
		powershell Expand-Archive HL2EP2Content.zip -DestinationPath HL2EP2Content
		echo Deleting Temporary Files...
		del "HL2EP2Content.zip"
		PING -n 4 127.0.0.1>nul
		echo HL2EP2Content successfully installed. Restart Garry's Mod for changes to take place.
		pause
		exit
	)
	IF "%addon%"=="4" (
		echo Downloading TF2Content...This may take awhile...
		powershell -Command "Invoke-WebRequest https://www.dropbox.com/s/za0vfamza4rqx4k/TF2Content.zip?dl=1 -OutFile TF2Content.zip"
		echo Finished Downloading TF2Content.zip
		PING -n 4 127.0.0.1>nul
		echo Extracting TF2Content...
		powershell Expand-Archive TF2Content.zip -DestinationPath TF2Content
		echo Deleting Temporary Files...
		del "TF2Content.zip"
		PING -n 4 127.0.0.1>nul
		echo TF2Content successfully installed. Restart Garry's Mod for changes to take place.
		pause
		exit
	)
	IF "%addon%"=="5" (
		echo Downloading L4D2Content...This may take awhile...
		powershell -Command "Invoke-WebRequest https://www.dropbox.com/s/n7m7gy6vkrx076t/L4D2Content.zip?dl=1 -OutFile L4D2Content.zip"
		echo Finished Downloading L4D2Content.zip
		PING -n 4 127.0.0.1>nul
		echo Extracting L4D2Content...
		powershell Expand-Archive L4D2Content.zip -DestinationPath L4D2Content
		echo Deleting Temporary Files...
		del "L4D2Content.zip"
		PINg -n 4 127.0.0.1>nul
		echo L4D2Content successfully installed. Restart Garry's Mod for changes to take place.
		pause
		exit
	)
	IF "%addon%"=="6" (
		echo Downloading PortalContent...This may take awhile...
		powershell -Command "Invoke-WebRequest https://www.dropbox.com/s/1861kg04fsr1k4a/PortalContent.zip?dl=1 -OutFile PortalContent.zip"
		echo Finished Downloading PortalContent.zip
		PING -n 4 127.0.0.1>nul
		echo Extracting PortalContent...
		powershell Expand-Archive PortalContent.zip -DestinationPath PortalContent
		echo Deleting Temporary Files...
		del "PortalContent.zip"
		PINg -n 4 127.0.0.1>nul
		echo PortalContent successfully installed. Restart Garry's Mod for changes to take place.
		pause
		exit
	)
	IF "%addon%"=="7" (
		echo Downloading Portal2Content...This may take awhile...
		powershell -Command "Invoke-WebRequest https://www.dropbox.com/s/11pxmul0evw4sxq/Portal2Content.zip?dl=1 -OutFile Portal2Content.zip"
		echo Finished Downloading Portal2Content.zip
		PING -n 4 127.0.0.1>nul
		echo Extracting Portal2Content...
		powershell Expand-Archive Portal2Content.zip -DestinationPath Portal2Content
		echo Deleting Temporary Files...
		del "Portal2Content.zip"
		PINg -n 4 127.0.0.1>nul
		echo Portal2Content successfully installed. Restart Garry's Mod for changes to take place.
		pause
		exit
	)
:custom
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
echo 1 - Attempt to automatically find Garry's Mod directory
echo 2 - Specify Garry's Mod directory manually
set /p option=What would you like to do? (1-2): 
IF "%option%"=="1" (
	cls
	goto customauto
)
IF "%option%"=="2" (
	cls
	goto customman
)
:customauto
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
echo Trying to find directory automatically...
set customautopath=C:\progra~2\Steam\steamapps\common\GarrysMod
PING -n 4 127.0.0.1>nul
IF EXIST "%customautopath%" ( 
	echo Found Garry's Mod installation directory. Moving to new directory
	PING -n 4 127.0.0.1>nul
	goto customautostart
) ELSE (
	echo Couldn't find directory
	PING -n 4 127.0.0.1>nul
	cls
	goto custom
)
:customman
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
set /p customdir=Input your Garry's Mod installation directory: 
IF EXIST "%customdir%/garrysmod/" ( 
	echo Moving to new directory
	PING -n 4 127.0.0.1>nul
	goto custommanstart
) ELSE (
	echo Not a valid Garry's Mod directory
	PING -n 4 127.0.0.1>nul
	cls
	goto custom
)
:customautostart
cls
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
set /p addonid=What is the ID of your addon? (Numbers at end of workshop URL): 
echo Downloading some temporary files...
if not exist "temp" mkdir "temp"
cd temp
powershell -Command "Invoke-WebRequest https://github.com/stedolan/jq/releases/download/jq-1.6/jq-win64.exe -OutFile jq.exe"
curl --location --request POST https://api.steampowered.com/ISteamRemoteStorage/GetPublishedFileDetails/v1 --header "Content-Type: application/x-www-form-urlencoded" --data-urlencode itemcount=1 --data-urlencode publishedfileids[0]=%addonid% -o fileinfo.json
FOR /F "delims=" %%i IN ('jq .response.publishedfiledetails[0].file_url fileinfo.json') DO set addonurl=%%i
del fileinfo.json
del jq.exe
IF %addonurl%=="" (
	goto isteamugcauto
)
cls
echo Older addon detected, using ISteamRemoteStorage interface...	
curl -o temp.gma %addonurl%
powershell -Command "Invoke-WebRequest http://z0mbieslayer.ddns.net/gmodcontent/7z.zip -OutFile 7z.zip"
powershell Expand-Archive 7z.zip -DestinationPath 7z
del 7z.zip
"7z/7z.exe" e temp.gma
del temp.gma
rename temp temp.gma
move temp.gma "%customautopath%\garrysmod\addons"
cd ..
rmdir /S /Q "temp"
goto customautofinal
:custommanstart
cls
echo *Make sure you are running this installer on the same drive as your Garry's Mod installation. If it isn't run on the 
echo same drive, the files won't be installed to the correct location.
echo.
set /p addonid=What is the ID of your addon? (Numbers at end of workshop URL): 
echo Downloading some temporary files...
if not exist "temp" mkdir "temp"
cd temp
powershell -Command "Invoke-WebRequest https://github.com/stedolan/jq/releases/download/jq-1.6/jq-win64.exe -OutFile jq.exe"
curl --location --request POST https://api.steampowered.com/ISteamRemoteStorage/GetPublishedFileDetails/v1 --header "Content-Type: application/x-www-form-urlencoded" --data-urlencode itemcount=1 --data-urlencode publishedfileids[0]=%addonid% -o fileinfo.json
FOR /F "delims=" %%i IN ('jq .response.publishedfiledetails[0].file_url fileinfo.json') DO set addonurl=%%i
del fileinfo.json
del jq.exe
IF %addonurl%=="" (
	goto isteamugcman
)
cls
echo Older addon detected, using ISteamRemoteStorage interface...	
curl -o temp.gma %addonurl%
powershell -Command "Invoke-WebRequest http://z0mbieslayer.ddns.net/gmodcontent/7z.zip -OutFile 7z.zip"
powershell Expand-Archive 7z.zip -DestinationPath 7z
del 7z.zip
"7z/7z.exe" e temp.gma
del temp.gma
rename temp temp.gma
move temp.gma "%customdir%\garrysmod\addons"
cd ..
rmdir /S /Q "temp"
goto custommanfinal
:isteamugcauto
cls
echo Newer addon detected, using ISteamUGC interface...
powershell -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamcmd.zip"
powershell Expand-Archive steamcmd.zip -DestinationPath steamcmd
start /B /wait steamcmd/steamcmd.exe +@ShutdownOnFailedCommand 1 +login anonymous +workshop_download_item 4000 %addonid% +quit >nul 2>&1
cd steamcmd/steamapps/workshop/content/4000/%addonid%
dir /b *.gma > tmp
set /p addonlocation=<tmp
del tmp
rename %addonlocation% temp.gma
move temp.gma "%customautopath%\garrysmod\addons"
cd ../../../../../../../
rmdir /S /Q "temp"
goto customautofinal
:customautofinal
cls
cd "%customautopath%\garrysmod\addons"
"%customautopath%\bin\gmad.exe" extract -file temp.gma -out %addonid%
del /f temp.gma
echo All done.
pause
exit
:isteamugcman
cls
echo Newer addon detected, using ISteamUGC interface...
powershell -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamcmd.zip"
powershell Expand-Archive steamcmd.zip -DestinationPath steamcmd
start /B /wait steamcmd/steamcmd.exe +@ShutdownOnFailedCommand 1 +login anonymous +workshop_download_item 4000 %addonid% +quit >nul 2>&1
cd steamcmd/steamapps/workshop/content/4000/%addonid%
dir /b *.gma > tmp
set /p addonlocation=<tmp
del tmp
rename %addonlocation% temp.gma
move temp.gma "%customdir%\garrysmod\addons"
cd ../../../../../../../
rmdir /S /Q "temp"
goto custommanfinal
:custommanfinal
cls
cd "%customdir%\garrysmod\addons"
"%customdir%\bin\gmad.exe" extract -file temp.gma -out %addonid%
del /f temp.gma
cls
echo All done.
pause
exit
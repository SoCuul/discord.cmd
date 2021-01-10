@echo off
cls
cd..
echo What would you like to configure?
echo 1) Main configuration
echo 2) Bot Token
echo 3) Install Modules
::Await Response
set /p configSelection="> "
IF "%configSelection%"=="1" (goto mainconfig)
IF "%configSelection%"=="2" (goto tokenconfig)
IF "%configSelection%"=="3" (goto installmodules)
::Invalid Selection
echo Invalid selection, please try again.
pause
cd batcmds
config


::Main Configuration
:mainconfig
cls
::Prefix
echo What should the bot prefix be?
set /p prefix="> "

::Presence Type
echo What should the presence type be?
echo 1) Playing
echo 2) Watching
echo 3) Listening
::Await Response
set /p presenseTypeResponse="> "
IF "%presenseTypeResponse%"=="1" (goto setvars)
IF "%presenseTypeResponse%"=="2" (goto setvars)
IF "%presenseTypeResponse%"=="3" (goto setvars)
::Invalid Selection
echo Invalid selection, please try again.
pause
goto mainconfig
::Set Variable
:setvars
IF "%presenseTypeResponse%"=="1" (set presenseType=PLAYING)
IF "%presenseTypeResponse%"=="2" (set presenseType=WATCHING)
IF "%presenseTypeResponse%"=="3" (set presenseType=LISTENING)

::Presence Activity
echo What should the presence activity be (the part after the presense type)
set /p presenseActivity="> "

::Delete previous file
IF EXIST "config.json" (
    del config.json
)
::Make the config file
set "line1={"
set "line2="prefix": "%prefix%","
set "line3="activityType": "%presenseType%","
set "line4="activityStatus": "%presenseActivity%""
set "line5=}"
echo %line1% >> config.json
echo %line2% >> config.json
echo %line3% >> config.json
echo %line4% >> config.json
echo %line5% >> config.json
echo.
echo Configuration Complete!
echo Prefix: %prefix%
echo Presence Type: %presenseType%
echo Presence Activity: %presenseActivity%
pause
main

::Token Configuration
:tokenconfig
cls
::Token
echo Please enter your bot token.
set /p token="> "

::Delete previous file
IF EXIST ".env" (
    del .env
)

::Make the env file
set "line1=TOKEN=%token%"
echo %line1% >> .env
echo.
echo Token Configuration Complete!
echo Token: %token%
pause
main

::Install Modules
:installmodules
cls
echo Installing modules...
echo Please run the main.bat file again once it says "added x packages"
npm install
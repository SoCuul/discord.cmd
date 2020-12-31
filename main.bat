@echo off
::Title
:selectaction
cls
echo.
echo ----------------------------------------------------------------
echo ^|        _ _                       _                     _     ^|
echo ^|       ^| (_)                     ^| ^|                   ^| ^|    ^|
echo ^|     __^| ^|_ ___  ___ ___  _ __ __^| ^|  ___ _ __ ___   __^| ^|    ^|
echo ^|    / _` ^| / __^|/ __/ _ \^| '__/ _` ^| / __^| '_ ` _ \ / _` ^|    ^|
echo ^|   ^| (_^| ^| \__ \ (_^| (_) ^| ^| ^| (_^| ^|^| (__^| ^| ^| ^| ^| ^| (_^| ^|    ^|
echo ^|    \__,_^|_^|___/\___\___/^|_^|  \__,_(_)___^|_^| ^|_^| ^|_^|\__,_^|    ^|
echo ^|                                                              ^|
echo ^|                   Created by SoCuul#0001                     ^|
echo ^|                                                              ^|
echo ----------------------------------------------------------------
echo.
echo.
::Action Selector
echo Welcome to discord.cmd. What would you like to do?
echo 1) Start the bot
echo 2) Create a command
echo 3) Delete a command
echo 4) List all commands
echo 5) Bot Configuration
::Await Response
set /p actionSelection="> "
IF "%actionSelection%"=="1" (goto startbot)
IF "%actionSelection%"=="2" (goto createcmd)
IF "%actionSelection%"=="3" (goto delcmd)
IF "%actionSelection%"=="4" (goto listcmds)
IF "%actionSelection%"=="5" (goto config)
::Invalid Selection
echo Invalid selection, please try again.
pause
goto selectaction


::Start Bot
:startbot
echo Starting up the bot...
node .
pause
goto selectaction


::Create Command
:createcmd
cls
echo What type of command would you like to create?
echo 1) Normal (Text)
echo 2) Embed
echo 3) DM
set /p cmdType="> "
IF "%cmdType%"=="1" (goto normalcmd)
IF "%cmdType%"=="2" (goto embedcmd)
IF "%cmdType%"=="3" (goto dmcmd)
::Invalid Selection
echo Invalid selection, please try again.
pause
goto createcmd

::Normal Command
:normalcmd
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "
::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    goto selectaction
)
::Command Response
echo What should the bot respond with when the command is used?
set /p cmdResponse="> "
::Make the command file
set "line1=module.exports = {"
set "line2=run(client, message, args) {"
set "line3=message.channel.send('%cmdResponse%')"
set "line4=}};"
echo %line1% >> %cmdName%.js
echo %line2% >> %cmdName%.js
echo %line3% >> %cmdName%.js
echo %line4% >> %cmdName%.js
echo.
echo Created command %cmdName%
echo Response: %cmdResponse%
pause
cd..
goto selectaction

::Embed Command
:embedcmd
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "
::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    goto selectaction
)
::Command Response
::Embed Color
echo What color should the embed be? (HTML or HEX only)
set /p embedColor="> "
::Embed title
echo What should the embed title be?
set /p embedTitle="> "
::Embed description
echo What should the embed message be?
set /p embedDescription="> "
::Make the command file
set "line1=module.exports = {"
set "line2=run(client, message, args, MessageEmbed) {"
set "line3=const embed = new MessageEmbed()"
set "line4=.setColor('%embedColor%')"
set "line5=.setTitle('%embedTitle%')"
set "line6=.setDescription('%embedDescription%')"
set "line7=message.channel.send(embed)"
set "line8=}};"
echo %line1% >> %cmdName%.js
echo %line2% >> %cmdName%.js
echo %line3% >> %cmdName%.js
echo %line4% >> %cmdName%.js
echo %line5% >> %cmdName%.js
echo %line6% >> %cmdName%.js
echo %line7% >> %cmdName%.js
echo %line8% >> %cmdName%.js
echo.
echo Created command %cmdName%
echo Embed Color: %embedColor%
echo Embed Title: %embedTitle%
echo Embed Message: %embedDescription%
pause
cd..
goto selectaction

::DM Command
:dmcmd
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "
::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    goto selectaction
)
::Command Response
echo What should the bot message the person who uses the command?
set /p cmdResponse="> "
::Make the command file
set "line1=module.exports = {"
set "line2=run(client, message, args) {"
set "line3=message.author.send('%cmdResponse%')"
set "line4=}};"
echo %line1% >> %cmdName%.js
echo %line2% >> %cmdName%.js
echo %line3% >> %cmdName%.js
echo %line4% >> %cmdName%.js
echo.
echo Created command %cmdName%
echo DM Response: %cmdResponse%
pause
cd..
goto selectaction


::Delete Command
:delcmd
cls
echo What is the name of the command you want to delete?
set /p cmdName="> "
cd commands
::Check if command exists
IF EXIST "%cmdName%.js" (
    del %cmdName%.js
    echo Deleted %cmdName%
    pause
    cd..
    goto selectaction
) ELSE (
  echo This command already exists. Please try again.
  pause
  cd..
  goto selectaction
)


::List Commands
:listcmds
cls
echo.
echo   _____                                          _     
echo  / ____^|                                        ^| ^|    
echo ^| ^|     ___  _ __ ___  _ __ ___   __ _ _ __   __^| ^|___ 
echo ^| ^|    / _ \^| '_ ` _ \^| '_ ` _ \ / _` ^| '_ \ / _` / __^|
echo ^| ^|___^| (_) ^| ^| ^| ^| ^| ^| ^| ^| ^| ^| ^| (_^| ^| ^| ^| ^| (_^| \__ \
echo  \_____\___/^|_^| ^|_^| ^|_^|_^| ^|_^| ^|_^|\__,_^|_^| ^|_^|\__,_^|___/
echo.
cd commands
for %%a in ("*") do @echo %%~na
echo.
pause
cd..
goto selectaction


::Configuration
:config
cls
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
goto config

::Main Configuration
:mainconfig
::Prefix
echo What color should the bot prefix be?
set /p prefix="> "
::Presence Type
echo What should the presence type be (all caps) (PLAYING, WATCHING or LISTENING)
set /p presenseType="> "
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
goto selectaction

::Token Configuration
:tokenconfig
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
goto selectaction

::Install Modules
:installmodules
cls
echo Installing modules...
echo Please run the main.bat file again once it says "added x packages"
npm install
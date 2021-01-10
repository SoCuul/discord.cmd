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
cd batcmds
IF "%actionSelection%"=="1" (startbot)
IF "%actionSelection%"=="2" (createcmd)
IF "%actionSelection%"=="3" (delcmd)
IF "%actionSelection%"=="4" (listcmds)
IF "%actionSelection%"=="5" (config)
cd..
::Invalid Selection
echo Invalid selection, please try again.
pause
goto selectaction
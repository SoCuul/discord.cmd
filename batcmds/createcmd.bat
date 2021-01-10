@echo off
cls
cd..
echo What type of command would you like to create?
echo 1) Normal (Text)
echo 2) Embed
echo 3) DM
echo 4) DM Embed
echo 5) Add Role
echo 6) Remove Role
set /p cmdType="> "
IF "%cmdType%"=="1" (goto normalcmd)
IF "%cmdType%"=="2" (goto embedcmd)
IF "%cmdType%"=="3" (goto dmcmd)
IF "%cmdType%"=="4" (goto dmembedcmd)
IF "%cmdType%"=="5" (goto addrolecmd)
IF "%cmdType%"=="6" (goto removerolecmd)
::Invalid Selection
echo Invalid selection, please try again.
pause
cd commands
createcmd

::Normal Command
:normalcmd
cls
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "

::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    main
)

::Command Response
echo What should the bot respond with when the command is used?
set /p cmdResponse="> "

::Make the command file
set "line1=module.exports = {"
set "line2=run(client, message, args) {"
set "line3=message.channel.send(`%cmdResponse%`)"
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
main


::Embed Command
:embedcmd
cls
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "

::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    main
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
set "line4=.setColor(`%embedColor%`)"
set "line5=.setTitle(`%embedTitle%`)"
set "line6=.setDescription(`%embedDescription%`)"
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
main


::DM Command
:dmcmd
cls
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "

::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    main
)

::Command Response
echo What should the bot message the person who uses the command?
set /p cmdResponse="> "

::Make the command file
set "line1=module.exports = {"
set "line2=run(client, message, args) {"
set "line3=message.author.send(`%cmdResponse%`)"
set "line4=}};"
echo %line1% >> %cmdName%.js
echo %line2% >> %cmdName%.js
echo %line3% >> %cmdName%.js
echo %line4% >> %cmdName%.js
echo.
echo Created dm command %cmdName%
echo DM Response: %cmdResponse%
pause
cd..
main

::DM Embed Command
:dmembedcmd
cls
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "

::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    main
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
set "line4=.setColor(`%embedColor%`)"
set "line5=.setTitle(`%embedTitle%`)"
set "line6=.setDescription(`%embedDescription%`)"
set "line7=message.author.send(embed)"
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
echo Created dm command %cmdName%
echo Embed Color: %embedColor%
echo Embed Title: %embedTitle%
echo Embed Message: %embedDescription%
pause
cd..
main


::Add Role Command
:addrolecmd
cls
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "

::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    main
)

::Role Name
echo What is the name of the role the user should recieve?
set /p roleName="> "

::Make the command file
set "line1=module.exports = {"
set "line2=run(client, message, args) {"
set "line3=let role = message.member.guild.roles.cache.find(r =^> r.name === '%roleName%')"
set "line4=if(!role) return message.channel.send(`❌ There was an error finding the '%roleName%' role. Please make sure it exists.`)"
set "line5=message.member.roles.add(role).catch(err =^> message.channel.send(`❌ There was an error adding the '%roleName%' role.`))"
set "line6=message.react('✅').catch(err =^> console.log(`❌ There was an error adding a reaction.`))"
set "line7=}};"
echo %line1% >> %cmdName%.js
echo %line2% >> %cmdName%.js
echo %line3% >> %cmdName%.js
echo %line4% >> %cmdName%.js
echo %line5% >> %cmdName%.js
echo %line6% >> %cmdName%.js
echo %line7% >> %cmdName%.js
echo.
echo Created add role command %cmdName%
echo Role: %roleName%
pause
cd..
main


::Remove Role Command
:removerolecmd
cls
::Command Name
echo What is the name of the new command? (Make sure the name is all lowercase with no symbols)
set /p cmdName="> "

::Name Check
cd commands
IF EXIST "%cmdName%.js" (
    echo This command already exists. Please try again.
    pause
    cd..
    main
)

::Role Name
echo What is the name of the role the user should have removed?
set /p roleName="> "

::Make the command file
set "line1=module.exports = {"
set "line2=run(client, message, args) {"
set "line3=let role = message.member.guild.roles.cache.find(r =^> r.name === '%roleName%')"
set "line4=if(!role) return message.channel.send(`❌ There was an error finding the '%roleName%' role. Please make sure it exists.`)"
set "line5=message.member.roles.remove(role).catch(err =^> message.channel.send(`❌ There was an error removing the '%roleName%' role.`))"
set "line6=message.react('✅').catch(err =^> console.log(`❌ There was an error adding a reaction.`))"
set "line7=}};"
echo %line1% >> %cmdName%.js
echo %line2% >> %cmdName%.js
echo %line3% >> %cmdName%.js
echo %line4% >> %cmdName%.js
echo %line5% >> %cmdName%.js
echo %line6% >> %cmdName%.js
echo %line7% >> %cmdName%.js
echo.
echo Created remove role command %cmdName%
echo Role: %roleName%
pause
cd..
main
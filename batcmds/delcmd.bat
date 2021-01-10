@echo off
cls
cd..
echo What is the name of the command you want to delete?
set /p cmdName="> "
cd commands

::Check if command exists
IF EXIST "%cmdName%.js" (
    del %cmdName%.js
    echo Deleted %cmdName%
    pause
    cd..
    main
) ELSE (
  echo This command already exists. Please try again.
  pause
  cd..
  main
)
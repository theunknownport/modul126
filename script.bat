@echo off

:PROMPT
echo ------------------------------------
echo 1. Alle Verbindungen lîschen		
echo 2. Drucker hinzufÅgen
echo 3. Netzwerklaufwerk einhÑngen
echo 4. Canon Druckertreiber installieren
set /p option="Option WÑhlen (1, 2, 3, 4): "

2>NUL CALL :CASE_%option%
IF ERRORLEVEL 1 $
cls
echo Fehleingabe, bitte erneut eingeben!
CALL :PROMPT


:CASE_1
cls
echo Lîsche alle Verbindungen...
net use * /delete
echo Alle Verbindungen gelîscht.
goto :CASE_END  
:CASE_2
cls
echo FÅge Drucker hinzu...
net use \\print.bbbaden.local\MFD_STANDARD_PCL
echo Drucker hinzugefÅgt.
goto :CASE_END
:CASE_3
cls
echo HÑnge Netzwerklaufwerk ein...
net use M: \\bbbaden.local\public\info /persistent:yes
echo Netzwerklaufwerk eingehÑngt.
goto :CASE_END
:CASE_4
cls
echo Exe wird ausgefÅhrt...
if not exist \\bbbaden.local\public\Info\DruckerCanon net use M: \\bbbaden.local\public
start /d "\\bbbaden.local\public\Info\DruckerCanon\" GPlus_PCL6_Driver_V250_32_64_00.exe
echo Druckertreiber installiert.

:CASE_END
pause
exit
  


  
  
   
@echo off

:PROMPT
echo ------------------------------------
echo 1. Alle Verbindungen l�schen		
echo 2. Drucker hinzuf�gen
echo 3. Netzwerklaufwerk einh�ngen
echo 4. Canon Druckertreiber installieren
set /p option="Option W�hlen (1, 2, 3, 4): "

2>NUL CALL :CASE_%option%
IF ERRORLEVEL 1 $
cls
echo Fehleingabe, bitte erneut eingeben!
CALL :PROMPT


:CASE_1
cls
echo L�sche alle Verbindungen...
net use * /delete
echo Alle Verbindungen gel�scht.
goto :CASE_END  
:CASE_2
cls
echo F�ge Drucker hinzu...
net use \\print.bbbaden.local\MFD_STANDARD_PCL
echo Drucker hinzugef�gt.
goto :CASE_END
:CASE_3
cls
echo H�nge Netzwerklaufwerk ein...
net use M: \\bbbaden.local\public\info /persistent:yes
echo Netzwerklaufwerk eingeh�ngt.
goto :CASE_END
:CASE_4
cls
echo Exe wird ausgef�hrt...
if not exist \\bbbaden.local\public\Info\DruckerCanon net use M: \\bbbaden.local\public
start /d "\\bbbaden.local\public\Info\DruckerCanon\" GPlus_PCL6_Driver_V250_32_64_00.exe
echo Druckertreiber installiert.

:CASE_END
pause
exit
  


  
  
   
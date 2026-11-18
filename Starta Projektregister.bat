@echo off
REM ============================================================
REM  Startar Projektregister i Chrome med --allow-file-access-from-files
REM  sa att appen kan komma ihag den gemensamma mappen mellan omstarter.
REM  Vid start: klicka "Anslut nu" i appen, sedan bara "Tillat" i dialogen.
REM  OBS: justera HTML-sokvagen nedan om er mapp ligger annorlunda.
REM ============================================================
setlocal

REM Sokvag till index.html i er SharePoint-mapp (OneDrive-synkad):
set "HTML=%USERPROFILE%\Kommunsamverkan\UPP-SSF-Tekniska-VA\index.html"

if not exist "%HTML%" (
  echo Hittade inte index.html har:
  echo   %HTML%
  echo Hogerklicka bat-filen, valj Redigera och justera HTML-sokvagen.
  pause
  exit /b 1
)

REM Hitta Chrome
set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%LocalAppData%\Google\Chrome\Application\chrome.exe"

if exist "%CHROME%" (
  start "" "%CHROME%" --allow-file-access-from-files "file:///%HTML:\=/%"
  exit /b 0
)

REM Edge om Chrome saknas
set "EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" set "EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

if exist "%EDGE%" (
  start "" "%EDGE%" --allow-file-access-from-files "file:///%HTML:\=/%"
  exit /b 0
)

echo Varken Chrome eller Edge hittades.
pause

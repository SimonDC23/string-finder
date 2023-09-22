@echo off
setlocal

set "target_string=getformfromfile"
set /a "files_found=0"

for /r %%i in (*.psc) do (
  findstr /m /I /r "%target_string%.*" "%%~i" >nul
  if not errorlevel 1 (
    echo Found one hiding in "%%~i".
    set /a "files_found+=1"
  )  
)

if %files_found% gtr 0 (
  echo.
  echo Total Hits: %files_found%
) else (
  echo.
  echo Nothing sus found, we gucci!
)
endlocal

pause
:: My windows 11 installaiton 
:: Rémy Denechere 28/11/2024
::
:: Disable command echoing for cleaner output
@echo off

set WORKDIR=%CD%
echo Current working directory: %WORKDIR%
echo ----------------------------------------------------------------

:: Install Git
echo Installing Git...
winget install -e --id Git.Git --accept-package-agreements --accept-source-agreements
echo ----------------------------------------------------------------

:: Install GitHub CLI
echo Installing GitHub CLI...
winget install -e --id GitHub.cli --accept-package-agreements --accept-source-agreements
echo ----------------------------------------------------------------

:: Install make
echo Installing make and CMake...
winget install -e --id GnuWin32.Make --accept-package-agreements --accept-source-agreements
echo ----------------------------------------------------------------

echo Searching for make.exe...
for /f "delims=" %%i in ('dir /s /b "C:\*\GnuWin32\*\make.exe"') do set "MAKE_DIR=%%~dpi"
:: Check if MAKE_DIR was set
if defined MAKE_DIR (
    echo make.exe found in: "%MAKE_DIR%"
    
    :: Add the directory to PATH
    set "PATH=%PATH%;%MAKE_DIR%"
    echo Updated PATH: "%PATH%"
) else (
    echo make.exe not found!
)
echo ----------------------------------------------------------------

:: Install CMake
winget install -e --id Kitware.CMake --accept-package-agreements --accept-source-agreements
echo Searching for cmake.exe...
for /f "delims=*" %%i in ('dir /s /b "C:\*\Kitware\*\cmake.exe"') do set "CMAKE_DIR=%%~dpi"
:: Check if CMAKE_DIR was set
if defined CMAKE_DIR (
    echo cmake.exe found in: "%MAKE_DIR%"
    
    :: Add the directory to PATH
    set "PATH=%PATH%;%CMAKE_DIR%"
    echo Updated PATH: "%PATH%"
) else (
    echo cmake.exe not found!
)
echo ----------------------------------------------------------------


:: Install tar
echo Installing 'tar' command...
winget install -e --id GnuWin32.Tar --accept-package-agreements --accept-source-agreements
echo ----------------------------------------------------------------

:: Install wget
echo Installing wget command...
winget install -e --id GNU.Wget --accept-package-agreements --accept-source-agreements
echo ----------------------------------------------------------------

:: Install GCC (includes gfortran)
echo Installing GCC (includes gfortran)...
winget install -e --id GNU.GCC --accept-package-agreements --accept-source-agreements
echo ----------------------------------------------------------------

:: Install netCDF (for Fortran libraries)
echo Installing netCDF Fortran libraries...
:: Winget does not currently support netCDF directly, so manual installation is recommended.


cd 'C:\Program Files (x86)\'
wget https://github.com/Unidata/netcdf-fortran/releases/download/v4.6.0/netcdf-fortran-4.6.0.tar.gz
tar -xvzf netcdf-fortran-4.6.0.tar.gz
cd netcdf-fortran-4.6.0
mkdir build && cd build
cmake ..
make && make install
echo ----------------------------------------------------------------

cd %WORKDIR%

echo Installation completed!

pause
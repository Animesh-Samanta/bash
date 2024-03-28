@echo off
setlocal

REM Author: Animesh
REM Script Date: 23rd October 2023

REM Set the Node.js version
set NODE_VERSION=v21.2.0

REM Set the download URL
set DOWNLOAD_URL=https://nodejs.org/dist/%NODE_VERSION%/node-%NODE_VERSION%-x64.msi

REM Set the output file name
set OUTPUT_FILE=node-%NODE_VERSION%-x64.msi

REM Download the Node.js MSI installer
echo Downloading Node.js MSI installer...
curl --insecure -o %OUTPUT_FILE% -L %DOWNLOAD_URL%

REM Check if the download was successful
if %errorlevel% neq 0 (
    echo Error: Failed to download Node.js MSI installer.
) else (
    echo Node.js MSI installer downloaded successfully: %OUTPUT_FILE%
    
    REM Install Node.js using the MSI installer
    echo Installing Node.js...
    start /wait msiexec /i %OUTPUT_FILE% /qn

    REM Check if the installation was successful
    if %errorlevel% neq 0 (
        echo Error: Failed to install Node.js.
    ) else (
        echo Node.js installed successfully.

        REM Your Angular installation command goes here
        echo Installing Angular...
        npm install -g @angular/cli
    )
)

REM Pause to keep the command prompt window open
pause

endlocal

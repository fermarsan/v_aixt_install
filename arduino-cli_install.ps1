# Description: This script needs to be run as Administrator
Set-PSDebug -Trace 0    #echo off

Write-Output "`nChecking Arduino CLI..."

if (-not (Get-Command -Name arduino-cli -ErrorAction SilentlyContinue)) { # if the command doesn't exist
    # Download arduino-cli.zip from the official page
    if (-not (Test-Path -Path "..\arduino-cli.zip")) {  # if the .zip file doesn't exist
        Write-Output "`nDownloading arduino-cli.zip from the official page..."
        Invoke-WebRequest "https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Windows_64bit.zip" -OutFile "..\arduino-cli.zip"
    }

    # Unzip arduino-cli.zip to C:\arduino-cli
    if (-not (Test-Path -Path "C:\arduino-cli")) {    # if the folder doesn't exist
        Write-Output "`nUnzipping arduino-cli.zip to C:\arduino-cli..."
        Expand-Archive -Path "..\arduino-cli.zip" -DestinationPath "C:\arduino-cli"
    } 

    # Create arduino-cli symlink (add it to PATH)
    Write-Output "`nCreating arduino-cli symlink..."
    $env:PATH += ";C:\arduino-cli\"
    [System.Environment]::SetEnvironmentVariable("PATH", $env:PATH, "User")
}
else {
    Write-Output "`narduino-cli is already installed."
}

# install AVR core
& "C:\arduino-cli\arduino-cli core install arduino:avr"

Write-Output "`nProcess completed."
Read-Host -Prompt "Press any key to continue"
[System.Environment]::Exit(0)   # exit to the main script
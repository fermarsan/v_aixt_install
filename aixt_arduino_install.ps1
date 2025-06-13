Set-PSDebug -Trace 0    #echo off

# this is a batch file to automate the installing of V and Aixt transpilers on Windows
# and the Arduino CLI tool

# Install git
if (-not (Get-Command -Name git -ErrorAction SilentlyContinue)) {  # if 'git' doesn't exist
    Write-Output "`nInstalling git..."
    winget install --id Git.Git -e --source winget
} 
else {
    Write-Output "`ngit is already installed."
} 

# Install V
if (-not (Get-Command -Name v -ErrorAction SilentlyContinue)) {  # if 'v doesn't exist
    # Clone V from its repository
    if (-not (Test-Path -Path "C:\v")) {  # if the C:\v folder doesn't exist
        Write-Output "`nCloning V from its repository..."
        # $script_path = Get-Location   # saves the original location path of this script
        cd c:\
        git clone --depth=1 https://github.com/vlang/v
    }
    
    # Compile V
    if (-not (Test-Path -Path "C:\v\v.exe")) {  # if the C:\v\v.exe file doesn't exist
        Write-Output "`nCompiling V..."
        cd v
        & "C:\v\make.bat"
    }
    # Create v symlink
    Write-Output "`nCreating V symlink..."
    C:\v\v.exe symlink
}
else {
    Write-Output "`nV is already installed."
    Write-Output "`nUpdating V..."
    C:\v\v.exe up    # update V
}

# restore the original location path 
# cd $script_path

# Install Aixt
if (-not (Get-Command -Name aixt -ErrorAction SilentlyContinue)) {  # if 'aixt' doesn't exist
    # Clone Aixt from its repository
    if (-not (Test-Path -Path "C:\aixt")) {  # if the C:\aixt folder doesn't exist
        Write-Output "`nCloning Aixt from its repository..."
        cd c:\
        git clone https://github.com/fermarsan/aixt.git
    }

    # Compile Aixt
    if (-not (Test-Path -Path "C:\aixt\aixt.exe")) {  # if the C:\aixt\aixt.exe file doesn't exist
        Write-Output "`nCompiling Aixt..."
        cd aixt
        C:\v\v.exe src -o aixt.exe  # & "C:\aixt\make.bat"
    }
    
    # Create aixt symlink
    Write-Output "`nCreating Aixt symlink..."
    C:\aixt\aixt.exe symlink
}
else {
    Write-Output "`nAixt is already installed."
} 

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
    [System.Environment]::SetEnvironmentVariable("PATH", $env:PATH, "Machine")
}
else {
    Write-Output "`narduino-cli is already installed."
}

# install AVR core
arduino-cli core install arduino:avr


# Restore the execution policy
Set-ExecutionPolicy Restricted

Write-Output "`nProcess completed."
Read-Host -Prompt "Press any key to continue"

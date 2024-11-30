Set-PSDebug -Trace 0    #echo off

# this is a batch file to automate the installing of V and Aixt transpilers on Windows

# Install git
if (-not (Get-Command git)) {  # if 'git' doesn't exist
    Write-Output "`nInstalling git..."
    winget install --id Git.Git -e --source winget
}

# Install V
if (-not (Get-Command v)) {  # if 'v doesn't exist
    # Download v.zip from the official repository
    if (-not (Test-Path -Path "..\v.zip")) {  # if the .zip file doesn't exist
        Write-Output "`nDownloading v.zip from the official repository..."
        Invoke-WebRequest "https://github.com/vlang/v/archive/refs/heads/master.zip" -OutFile "..\v.zip"
    }

    # Unzip v.zip to C:\v
    if (-not (Test-Path -Path "C:\v")) {    # if the folder doesn't exist
        Write-Output "`nUnzipping v.zip to C:\v..."
        Expand-Archive -Path "..\v.zip" -DestinationPath "C:\v"
    } 

    # Compile V
    cd c:\v
    & ".\make.bat"

    # Create v symlink
    # if (-not (Get-Command v)) { # if the command doesn't exist
    #     Write-Output "`nCreating V symlink..."
    #     $env:PATH += ";C:\v\"
    #     [System.Environment]::SetEnvironmentVariable("PATH", $env:PATH, "Machine")
    # }
    .\v.exe symlink
}

# Install Aixt
if (-not (Get-Command aixt)) {  # if 'aixt' doesn't exist
    # Download aixt.zip from the official repository
    if (-not (Test-Path -Path "..\aixt.zip")) {  # if the .zip file doesn't exist
        Write-Output "`nDownloading aixt.zip from the official repository..."
        Invoke-WebRequest "https://github.com/fermarsan/aixt/archive/refs/heads/main.zip" -OutFile "..\aixt.zip"
    }

    # Unzip aixt.zip to C:\aixt
    if (-not (Test-Path -Path 'C:\aixt')) { # if the folder doesn't exist
        Write-Output "`nUnzipping aixt.zip to C:\aixt..."
        Expand-Archive -Path '..\aixt.zip' -DestinationPath 'C:\aixt'
    }


    # Compile Aixt
    cd c:\aixt
    & ".\make.bat"

    # # Create aixt symlink
    # if (-not (Get-Command aixt)) {  # if the command doesn't exist
    #     Write-Output "`nCreating Aixt symlink..."
    #     $env:PATH += ";C:\aixt\"
    #     [System.Environment]::SetEnvironmentVariable("PATH", $env:PATH, "Machine")
    # }
    .\aixt.exe symlink
}

# Restore the execution policy
Set-ExecutionPolicy Restricted

Write-Output "`nProcess completed."
Read-Host -Prompt "Press any key to continue"
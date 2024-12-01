Set-PSDebug -Trace 0    #echo off

# this is a batch file to automate the installing of V and Aixt transpilers on Windows

# Install git
if (-not (Get-Command git)) {  # if 'git' doesn't exist
    Write-Output "`nInstalling git..."
    winget install --id Git.Git -e --source winget
}

# Install V
if (-not (Get-Command v)) {  # if 'v doesn't exist
    # Clone V from itse repository
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

# restore the original location path 
# cd $script_path

# Install Aixt
if (-not (Get-Command aixt)) {  # if 'aixt' doesn't exist
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
        & "C:\aixt\make.bat"
    }
    
    # Create aixt symlink
    Write-Output "`nCreating Aixt symlink..."
    C:\aixt\aixt.exe symlink
}

# Restore the execution policy
Set-ExecutionPolicy Restricted

Write-Output "`nProcess completed."
Read-Host -Prompt "Press any key to continue"

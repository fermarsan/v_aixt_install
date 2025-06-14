Set-PSDebug -Trace 0    #echo off

# this is a batch file to automate the installing of V and Aixt transpilers on Windows
# and the Arduino CLI tool

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
        & "C:\aixt\make.bat"    # C:\v\v.exe src -o aixt.exe
    }

    # Check the installed version of Aixt 
    C:\aixt\aixt.exe version
    
    # Create aixt symlink
    Write-Output "`nCreating Aixt symlink..."
    C:\aixt\aixt.exe symlink
}
else {
    Write-Output "`nAixt is already installed."
} 

[System.Environment]::Exit(0)   # exit to the main script
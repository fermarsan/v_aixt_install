Set-PSDebug -Trace 0    #echo off

# this is a batch file to automate the installing of V and Aixt transpilers on Windows
# and the Arduino CLI tool


# Install V
if (-not (Get-Command -Name v -ErrorAction SilentlyContinue)) {  # if 'v doesn't exist
    # Clone V from its repository
    if (-not (Test-Path -Path "C:\v")) {  # if the C:\v folder doesn't exist
        Write-Output "`nCloning V from its repository..."
        # $script_path = Get-Location   # saves the original location path of this script
        cd C:\
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

[System.Environment]::Exit(0)   # exit to the main script
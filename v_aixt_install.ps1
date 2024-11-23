Set-PSDebug -Trace 0    #echo off

# this is a batch file to automate the installing of V and Aixt transpilers on Windows
# copy 'v_windows.zip' and 'aixt_windows.zip' in the same folder of this file after executing as administrator

# Unzip v_windows.zip to C:\v
if (-not (Test-Path -Path 'C:\v')) {    # if the folder doesn't exist
    Write-Output 'Unzipping v_windows.zip to C:\v...'
    Expand-Archive -Path '.\v_windows.zip' -DestinationPath 'C:\'
} 

# Create v symlink
if (-not (Get-Command v)) { # if the command doesn't exist
    Write-Output "Creating V symlink..."
    $env:PATH += ";C:\v\"
    [System.Environment]::SetEnvironmentVariable("PATH", $env:PATH, "Machine")
}


# Unzip aixt.zip to C:\aixt
if (-not (Test-Path -Path 'C:\aixt')) { # if the folder doesn't exist
    Write-Output "Unzipping aixt_windows.zip to C:\aixt..."
    Expand-Archive -Path '.\aixt_windows.zip' -DestinationPath 'C:\'
}

# Create aixt symlink
if (-not (Get-Command aixt)) {  # if the command doesn't exist
    Write-Output "Creating Aixt symlink..."
    $env:PATH += ";C:\aixt\"
    [System.Environment]::SetEnvironmentVariable("PATH", $env:PATH, "Machine")
}

Write-Output "Process completed."
Read-Host -Prompt "Press any key to continue"
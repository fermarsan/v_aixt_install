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
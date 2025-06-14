Set-PSDebug -Trace 0    #echo off

# Install git
if (-not (Get-Command -Name git -ErrorAction SilentlyContinue)) {  # if 'git' doesn't exist
    Write-Output "`nInstalling git..."
    winget install --id Git.Git -e --source winget
} 
else {
    Write-Output "`ngit is already installed."
} 

[System.Environment]::Exit(0)   # exit to the main script
Set-PSDebug -Trace 0    #echo off

# This is a script to automate the installing on Windows of V and Aixt by using Git
# also installs the Arduino CLI tool

Write-Output "`nChecking git..."
Start-Process powershell -ArgumentList "-NoExit -File .\git_install.ps1" -WorkingDirectory $PWD -Wait # -Verb RunAs

Write-Output "`nChecking V..."
Start-Process powershell -ArgumentList "-NoExit -File .\v_install.ps1" -WorkingDirectory $PWD -Wait # -Verb RunAs

Write-Output "`nChecking Aixt..."
Start-Process powershell -ArgumentList "-NoExit -File .\aixt_install.ps1" -WorkingDirectory $PWD -Wait # -Verb RunAs

Write-Output "`nChecking Arduino CLI..."
Start-Process powershell -ArgumentList "-NoExit -File .\arduino-cli_install.ps1" -WorkingDirectory $PWD -Wait # -Verb RunAs

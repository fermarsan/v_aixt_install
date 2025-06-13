# V and Aixt installing script

This script installs the most recent versions of [**_v_**](https://vlang.io/) and [**_aixt_**](https://github.com/fermarsan/aixt) from their repositories source code, adding both to the _PATH_ environment variable for Windows x64. Additionally, **_git_** is installed if it is not done.

Follow these steps:

- open **_PowerShell_** as administrator 
    - press: ⊞ Win + "PowerShell"
    - right click on the **_PowerShell_** icon and select **"Run as administrator"**
- run the command: `Set-ExecutionPolicy Unrestricted`
- from **_PowerShell_** open the folder with the script `v_aixt_install.ps1`
    - example: `cd C:\Users\User1\Downloads\v_aixt_install`
- run the script as: `.\v_aixt_install.ps1`

**NOTE:** If additionally **_arduino-cli_** is required to be installed, the script `.\aixt_arduino_install.ps1` has to be executed instead of `.\aixt_install.ps1`
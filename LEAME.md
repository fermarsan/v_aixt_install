# Script de instalación de V y Aixt

Este script instala las versiones mas reciantes de [**_v_**](https://vlang.io/) y [**_aixt_**](https://github.com/fermarsan/aixt) a partir del código fuente de sus repositorios, añadiendo ambos a la variable de entorno _PATH_ para Windows x64. Adicionalmente, se instala **_git_** si aún lo está.

Siga estos pasos:

- abrir **_PowerShell_** como administrador 
    - pulsar: ⊞ Win + "PowerShell"
    - clic derecho sobre el icono de **_PowerShell_** y seleccionar **"Ejecutar como administrador"**
- ejecutar el comando: `Set-ExecutionPolicy Unrestricted`
- desde **_PowerShell_** abrir la carpeta con el script `aixt_install.ps1`.
    - ejemplo: `cd C:\Users\User1\Downloads\aixt_install`
- ejecutar el script como: `.\aixt_install.ps1`

**NOTA:** Si adicionalmente se desea instalar **_arduino-cli_**, se tiene que ejecutar el script `.\aixt_arduino_install.ps1` en lugar de `.\aixt_install.ps1`
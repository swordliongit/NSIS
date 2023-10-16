; Define the name and version of your installer
Name "MSS5004W Firmware Upgrader v1 Installer"
OutFile "MSS5004W Firmware Upgrader v1 Setup.exe"

; Specify the folder where the files should be installed
InstallDir "$PROGRAMFILES\MSS5004W Firmware Upgrader\"

; Specify the actions that should be performed during the installation process
Section "Installation"

    ; Copy the whole "MSS5004W Firmware Upgrader" folder to the installation directory
    SetOutPath "$INSTDIR"
    File /r "MSS5004W Firmware Upgrader\"

    ; Create a shortcut for the main exe in the desktop
    CreateShortCut "$DESKTOP\MSS5004W Firmware Upgrader.lnk" "$INSTDIR\MSS5004W Firmware Upgrader.exe"

SectionEnd

; Uninstaller section
Section "Uninstall"

    ; Remove the installed files
    Delete "$INSTDIR\*.*"
    RMDir "$INSTDIR"

    ; Remove the desktop shortcut
    Delete "$DESKTOP\MSS5004W Firmware Upgrader.lnk"

SectionEnd

; Create an uninstaller executable
WriteUninstaller "$INSTDIR\Uninstall.exe"

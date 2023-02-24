; Define the name and version of your installer
Name "Master Modem Odoo v1.3.2 Installer"
OutFile "Master Modem Odoo v1.3.2 Setup.exe"

; Specify the folder where the files should be installed
InstallDir "$PROGRAMFILES\Master Modem Odoo v1.3.2\"

; Specify the actions that should be performed during the installation process
Section "Installation"

    ; Run the required installer non-silent
    ExecWait "$EXEDIR\npcap-1.72.exe"

    ; Copy the whole "Modem Master Odoo v1.1.2" folder to the installation directory
    SetOutPath "$INSTDIR"
    File /r "Master Modem Odoo v1.3.2\"

    ; Create a shortcut for the main exe in the desktop
    CreateShortCut "$DESKTOP\Master Modem Odoo.lnk" "$INSTDIR\Master Modem Odoo\Master Modem Odoo.exe"

SectionEnd

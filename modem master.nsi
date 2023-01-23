; Define the name and version of your installer
Name "Modem Master Odoo v1.1.2 Installer"
OutFile "ModemMasterOdoo_v1.1.2_Installer.exe"

; Specify the folder where the files should be installed
InstallDir "$PROGRAMFILES\Modem Master Odoo v1.1.2"

; Specify the actions that should be performed during the installation process
Section "Installation"

    ; Run the required installer non-silent
    ExecWait "$EXEDIR\npcap-1.72.exe"

    ; Copy the whole "Modem Master Odoo v1.1.2" folder to the installation directory
    ;File "modem_master_odoo_v1.1.2\*"
    SetOutPath "$INSTDIR"
    File /r "modem_master_odoo_v1.1.2\"

    ; Create a shortcut for the main exe in the desktop
    CreateShortCut "$DESKTOP\Modem Master Odoo.lnk" "$INSTDIR\Modem Master Odoo.exe"

SectionEnd

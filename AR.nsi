; Define the name and version of your installer
Name "Autorobot Installer"
OutFile "Autorobot Setup.exe"
!define PRODUCT_VERSION "1.0.0.0"
!define VERSION "1.0.0.0"

VIProductVersion "${PRODUCT_VERSION}"
VIFileVersion "${VERSION}"
VIAddVersionKey "FileVersion" "${VERSION}"
VIAddVersionKey "LegalCopyright" "(C) Kılıçarslan Inc."
VIAddVersionKey "FileDescription" "Autorobot"


!define REGUNINSTKEY "Autorobot" ;Using a GUID here is not a bad idea
!define REGHKEY HKLM ;Assuming RequestExecutionLevel admin AKA all user/machine install
!define REGPATH_WINUNINST "Software\Microsoft\Windows\CurrentVersion\Uninstall"

Section
    WriteRegStr ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "DisplayName" "Autorobot"
    WriteRegStr ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "UninstallString" '"$INSTDIR\Uninstall.exe"'
SectionEnd

; Specify the folder where the files should be installed
InstallDir "$PROGRAMFILES\Autorobot\"

; Specify the actions that should be performed during the installation process
Section "Installation"

    ; Copy the whole "Autorobot" folder to the installation directory
    SetOutPath "$INSTDIR"
    File /r "Autorobot\"

    ; Create a shortcut for the main exe in the desktop
    CreateShortCut "$DESKTOP\Autorobot.lnk" "$INSTDIR\Autorobot.exe"

    ; Create a shortcut in the Start Menu
    CreateShortCut "$SMPROGRAMS\Autorobot\Autorobot.lnk" "$INSTDIR\Autorobot.exe"

    ; Create an uninstaller executable
    WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

; Uninstaller section
Section "Uninstall"

    ; Remove the installed files
    RMDir /r "$INSTDIR"

    ; Remove the desktop shortcut
    Delete "$DESKTOP\Autorobot.lnk"

    ; Remove the Start Menu shortcut
    Delete "$SMPROGRAMS\Autorobot\Autorobot.lnk"

    ; Optionally, remove entries from the Windows Registry
    DeleteRegKey ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}"

SectionEnd



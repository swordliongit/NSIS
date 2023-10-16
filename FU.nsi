; Define the name and version of your installer
Name "MSS5004W Firmware Upgrader Installer"
OutFile "MSS5004W Firmware Upgrader Setup.exe"
!define PRODUCT_VERSION "1.0.0.0"
!define VERSION "1.0.0.0"

VIProductVersion "${PRODUCT_VERSION}"
VIFileVersion "${VERSION}"
VIAddVersionKey "FileVersion" "${VERSION}"
VIAddVersionKey "LegalCopyright" "(C) Kılıçarslan Inc."
VIAddVersionKey "FileDescription" "MSS5004W Firmware Upgrader"


!define REGUNINSTKEY "MSS5004W-FU" ;Using a GUID here is not a bad idea
!define REGHKEY HKLM ;Assuming RequestExecutionLevel admin AKA all user/machine install
!define REGPATH_WINUNINST "Software\Microsoft\Windows\CurrentVersion\Uninstall"

Section
    WriteRegStr ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "DisplayName" "MSS5004W Firmware Upgrader"
    WriteRegStr ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "UninstallString" '"$INSTDIR\Uninstall.exe"'
SectionEnd

; Specify the folder where the files should be installed
InstallDir "$PROGRAMFILES\MSS5004W Firmware Upgrader\"

; Specify the actions that should be performed during the installation process
Section "Installation"

    ; Copy the whole "MSS5004W Firmware Upgrader" folder to the installation directory
    SetOutPath "$INSTDIR"
    File /r "MSS5004W Firmware Upgrader\"

    ; Create a shortcut for the main exe in the desktop
    CreateShortCut "$DESKTOP\MSS5004W Firmware Upgrader.lnk" "$INSTDIR\MSS5004W Firmware Upgrader.exe"

    ; Create a shortcut in the Start Menu
    CreateShortCut "$SMPROGRAMS\MSS5004W Firmware Upgrader\MSS5004W Firmware Upgrader.lnk" "$INSTDIR\MSS5004W Firmware Upgrader.exe"

    ; Create an uninstaller executable
    WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

; Uninstaller section
Section "Uninstall"

    ; Remove the installed files
    RMDir /r "$INSTDIR"

    ; Remove the desktop shortcut
    Delete "$DESKTOP\MSS5004W Firmware Upgrader.lnk"

    ; Remove the Start Menu shortcut
    Delete "$SMPROGRAMS\MSS5004W Firmware Upgrader\MSS5004W Firmware Upgrader.lnk"

    ; Optionally, remove entries from the Windows Registry
    DeleteRegKey ${REGHKEY} "${REGPATH_WINUNINST}\${REGUNINSTKEY}"

SectionEnd



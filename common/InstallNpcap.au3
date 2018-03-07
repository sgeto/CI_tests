; Npcap Installer options
; =======================
;
; /D=C:\Path With Spaces:     Overwrite the destination directory for Npcap's
;                             logs and helper utilities. The /D option must come
;                             last.
; /disable_restore_point=yes: Prevent the installer from setting a system
;                             restore point.
; /npf_startup=yes:           Start the Npcap driver/service at system start.
; /loopback_support=yes:      Support loopback traffic (“Npcap Loopback Adapter”
;                             will be created)
; /dlt_null=no:               Use DLT_EN10MB (Ethernet) as the
;                             “Npcap Loopback Adapter”'s link layer protocol
;                             instead of the default DLT_NULL.
; /admin_only=yes:            Restrict Npcap driver's access to Administrators
;                             only.
; /dot11_support=yes:         Support raw 802.11 traffic (and “Monitor Mode”)
;                             for wireless adapters.
; /vlan_support=yes:          Support 802.1Q VLAN tag when capturing and sending
;                             data.
; /winpcap_mode=yes:          Install Npcap in WinPcap API-compatible Mode.

; "%PROGRAMFILES%\npcap\Uninstall.exe" /S /Q /no_kill=no

; https://www.maketecheasier.com/create-automation-scripts-for-windows-with-autoit/
; https://msfn.org/board/topic/52181-the-guide-of-using-autoit-for-silent-install/
; Run the Npcap installer with most options enabled.
Run ("latest-npcap-installer.exe /disable_restore_point=yes /npf_startup=yes /loopback_support=yes /dlt_null=no /admin_only=no /dot11_support=yes /vlan_support=yes /winpcap_mode=yes")

; Wait for the setup window to become active.
; If it doesn't, force it.
WinWait ("Npcap", "License Agreement")
If Not WinActive ("Npcap", "License Agreement") Then WinActivate ("Npcap", "License Agreement")
WinWaitActive ("Npcap", "License Agreement")

; Accept the license agreement.
Send ("!a")

; Confirm installation (options are already set via Run function).
Send ("!i")

; Wait for the installation to complete.
WinWaitActive ("Npcap", "Installation Complete")

; Go to final window.
Send ("!n")

; Finish/Close setup.
Send("{Enter}")
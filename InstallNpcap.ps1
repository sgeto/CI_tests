# Config
$urlPath = "https://nmap.org/npcap/dist/latest-npcap-installer.exe"
$autoit = 'Run ("latest-npcap-installer.exe /disable_restore_point=yes /npf_startup=yes /loopback_support=yes /dlt_null=no /admin_only=no /dot11_support=yes /vlan_support=yes /winpcap_mode=yes")
WinWait ("Npcap", "License Agreement")
If Not WinActive ("Npcap", "License Agreement") Then WinActivate ("Npcap", "License Agreement")
WinWaitActive ("Npcap", "License Agreement")
Send ("!a")
Send ("!i")
WinWaitActive ("Npcap", "Installation Complete")
Send ("!n")
Send ("Enter")'

############

echo "Install AutoIT"
choco install -y --no-progress autoit.commandline > $null

echo "Generate InstallNpcap.au3"
$autoit | Out-File $PSScriptRoot"\InstallNpcap.au3"

echo "Download the latest Npcap installer"
wget $urlPath -UseBasicParsing -OutFile $PSScriptRoot"\latest-npcap-installer.exe"

############

echo "Generate InstallNpcap.exe from InstallNpcap.au3"
Start-Process -FilePath "Aut2exe.exe" -ArgumentList "/in InstallNpcap.au3 /out InstallNpcap.exe /nopack /comp 2 /Console" -NoNewWindow -Wait
# Invoke-Expression "cmd.exe /c Aut2exe.exe /in InstallNpcap.au3 /out InstallNpcap.exe /nopack /comp 2 /Console"

# Aut2exe.exe /in InstallNpcap.au3 /out InstallNpcap.exe /nopack /comp 2 /Console

echo "Run InstallNpcap.exe"
Start-Process -FilePath .\InstallNpcap.exe -NoNewWindow -Wait

# Success!
echo "Npcap installation completed"

# echo Cleanup
# Remove-Item *.exe, *.au3
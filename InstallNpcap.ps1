# Config
$urlPath = "https://nmap.org/npcap/dist/npcap-0.90.exe"
$urlPath2 = "https://nmap.org/npcap/dist/latest-npcap-installer.exe"
$checksum = "0477a42a9c54f31a7799fb3ee0537826041730f462abfc066fe36d81c50721a7"

############
############
# Download the file
wget $urlPath -UseBasicParsing -OutFile $PSScriptRoot"\npcap.exe"

# Now let's check its checksum
$_chksum = $(CertUtil -hashfile $PSScriptRoot"\npcap.exe" SHA256)[1] -replace " ",""
if ($_chksum -ne $checksum){
    echo "Checksums does NOT match !"
    exit
} else {
    echo "Checksums matches !"
}
# Run installer
Start-Process $PSScriptRoot"\npcap.exe" -ArgumentList "/loopback_support=yes /winpcap_mode=yes /dot11_support=yes" -wait
echo "Npcap installation completed"

wget $urlPath2 -UseBasicParsing -OutFile $PSScriptRoot"\npcap2.exe"
7z x -y -o"$env:PROGRAMFILES\Npcap" npcap2.exe

Copy-Item 
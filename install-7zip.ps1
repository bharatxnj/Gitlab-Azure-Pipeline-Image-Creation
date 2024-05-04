$InstallerUrl = "https://www.7-zip.org/a/7z1900-x64.msi"  # Adjust for 32-bit if needed
$InstallerPath = "$env:TEMP\7z1900-x64.msi"

(New-Object System.Net.WebClient).DownloadFile($InstallerUrl, $InstallerPath)
Start-Process msiexec.exe -ArgumentList '/i', $InstallerPath, '/quiet', '/norestart' -Wait
Remove-Item $InstallerPath

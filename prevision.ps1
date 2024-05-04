$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Install-PackageProvider -Name NuGet -confirm:$False -Force 
Install-Module -Name 7Zip4Powershell -Confirm:$False -Force

$artifactory_url = "https://jfrog.sdp.i.mercedes-benz.com"
$artifactory_repo = "artifactory/CDW-CDW/client_setup_files_cdw/cdcctools"
$artifact_name = "PREEvisionV1050_Power_PROD.7z"

# Destination folder path (replace with desired location)
$destination_folder = "C:\prevision\"

# Your JFrog token (replace with your actual token)
$global:artifactory_token = "Enter the token"

# Download the 7zip file from Artifactory
$authHeader = "Bearer $global:artifactory_token"
$downloadUrl = "$artifactory_url/$artifactory_repo/$artifact_name"

try {
  $downloadResponse = Invoke-webrequest -Uri $downloadUrl -UseBasicParsing -Method Get -Headers @{Authorization = $authHeader} -OutFile (New-Item -ItemType File -Path "$destination_folder\$artifact_name" -Force)
  Write-Host "7zip file downloaded successfully to: $destination_folder\$artifact_name"
} catch {
  Write-Error "Error downloading file: $_"
  Exit 1
}

# Create the folder (if it doesn't exist)
if (!(Test-Path $destination_folder)) {
  New-Item -ItemType Directory -Path $destination_folder | Out-Null
  Write-Host "Destination folder created: $destination_folder"
}

Expand-7zip -archivefilename "C:\prevision\PREEvisionV1050_Power_PROD.7z" -TargetPath "C:\prevision"

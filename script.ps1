# PowerShell Script to Uninstall a Specified Update
# Couldn't verify if it works but worst case it will just not uninstall the update
# Has to be run as Administrator

# As far as I understand KB5063878 is the cumaltive update that is causing the issue while KB5062660 is the security update that is linked to it but not causing the SSD issue
$updateToRemove = "KB5063878"
# Transform "KB5063878" -> "5063878" for wusa.exe
$kbNumber = $updateToRemove -replace "KB", ""

# Check if the update is installed
$update = Get-HotFix | Where-Object {$_.HotFixID -eq $updateToRemove}

if ($update) {
    Write-Host "$updateToRemove is installed. Proceeding with uninstall..." -ForegroundColor Yellow

    # Uninstall the update silently, wusa.exe is the built-in windows update-installation application 
    wusa.exe /uninstall /kb:$kbNumber /quiet /norestart

    Write-Host "Uninstall command sent. Please restart your computer to complete the process." -ForegroundColor Green
} else {
    Write-Host "$updateToRemove is not installed on this system." -ForegroundColor Cyan
}

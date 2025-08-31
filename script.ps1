# PowerShell Script to Uninstall a Specified Update
# Verified inside a VM running win 11
# Has to be run as Administrator

# As far as I understand KB5063878 is the cumaltive update that is causing the issue while KB5062660 is the security update that is linked to it but not causing the SSD issue
$updateToRemove = "KB5063878"
# Transform "KB5063878" -> "5063878" for wusa.exe
$kbNumber = $updateToRemove -replace "KB", ""

# Check if the update is installed
$update = Get-HotFix | Where-Object {$_.HotFixID -eq $updateToRemove}

if ($update) {
    Write-Host "$updateToRemove is installed. Proceeding with uninstall..." -ForegroundColor Yellow

    # Build command to: Uninstall the update silently, wusa.exe is the built-in windows update-installation application
    $cmd = "wusa.exe /uninstall /kb:$kbNumber /norestart"
    # Execute previoiusly built wusa.exe command (this is done because otherwise it wouldn't interprete $kbNumber right in the command)
    Invoke-Expression $cmd

    Write-Host "Uninstall command sent. Please restart your computer to complete the process." -ForegroundColor Green
} else {
    Write-Host "$updateToRemove is not installed on this system." -ForegroundColor Cyan
}

# Keyprompt so that shell window doesn't close for some usecases
Write-Host "Press any key to continue..."
$_ = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

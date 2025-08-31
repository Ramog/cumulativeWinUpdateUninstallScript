# Info
This script is supposed to uninstall the Windows 11 featureupdate (KB5063878) that messes with SSD controllers by using wusa.exe, the built-in windows update-installation application.
`wusa.exe /uninstall` is designed for safe update uninstallation so it can't really break your OS.

If you need it to remove another update instead, the target of the script can easily be changed by changing line 6 `$updateToRemove = "KB5063878"` to a different update you want to remove.

Some notes: 
- I couldn't test if it actually removes the update since windows 11 never installed the update on my pc to begin with but all the info I found points to yes
- Worst case it will fail to remove the update but your system will be unchanged
- Keep in mind that this will also remove all the security patches that might have been in `KB5063878` but this preferable to the SSD-Controller issues it causes

# How to execute this script

1. Download `script.ps1` from this repository
2. Open a Powershell window as admin
   
   Search for powershell in the startmenu, on the right side of the result window click on 'Execute as Admin'   
3. Since you downloaded the script from a webpage you most likely have to first tell your PC that this file is safe to execute
   
   To do this you can use the command, this will remove the "downloaded"-tag from this specific file and make it executable on your pc regardless of your System-Settings
   ```powershell
   Unblock-File -Path "C:\Path\To\script.ps1"
   ```
5. Since Powershell comes with a built-in execution protection you need use this to start the script
   ```powershell
   powershell -ExecutionPolicy Bypass -File "C:\Path\To\script.ps1"
   ```
   It will start `script.ps1` even if your PCs global execution policy is set to not execute powershell scripts at all but most importantly it will not change any settings on your system or open any permanent loopholes

# Info
This script uninstalls the Windows 11 featureupdate (KB5063878), that messes with SSD controllers, by using wusa.exe – the built-in windows update-installation application.
`wusa.exe /uninstall` is designed for safe update uninstallation so it can't really break your OS.

It's important to note that you still need to prevent windows to install the update by itself again. Here is a tool provided by microsoft that prevents that and can be used after you restarted your pc to apply the uninstall, trust me I wish I knew why it has no official description page but its the best and simplest tool to disable single windows updates 
https://download.microsoft.com/download/f/2/2/f22d5fdb-59cd-4275-8c95-1be17bf70b21/wushowhide.diagcab

If you need it to remove another update instead, the target of the script can easily be changed by changing line 6 `$updateToRemove = "KB5063878"` to a different update you want to remove.

Some notes: 
- ~~I couldn't test if it actually removes the update since windows 11 never installed the update on my pc to begin with but all the info I found points to yes~~

  Tested in win 11 VM, works well at removing the update, however entry will not be removed from update history (this is purely visual)
- Keep in mind that this will also remove all the security patches that might have been in `KB5063878` but this preferable to the SSD-Controller issues it causes

# How to execute this script

1. Download `script.ps1` from this repository
2. Open a Powershell window as admin
   
   Search for powershell in the startmenu, on the right side of the result window click on 'Execute as Admin'   
3. Since you downloaded the script from a webpage you most likely have to first tell your PC that this file is safe to execute
   
   To do this you can use the following command, this will remove the "downloaded"-tag from this specific file and make it executable on your pc regardless of your system-settings
   ```powershell
   Unblock-File -Path "C:\Path\To\script.ps1"
   ```
   Of course you need to swap out `C:\Path\To\script.ps1` with the correct path of the script
5. Since Powershell comes with a built-in execution protection you need use this to start the script
   ```powershell
   powershell -ExecutionPolicy Bypass -File "C:\Path\To\script.ps1"
   ```
   Of course you need to swap out `C:\Path\To\script.ps1` with the correct path of the script
   
   It will start `script.ps1` even if your PCs global execution policy is set to not execute powershell scripts at all but most importantly it will not change any settings on your system or open any permanent loopholes
6. After executing the script a dialog box will pop up, asking you if you want to deinstall the update. Click yes
7. Wait for the uninstall process to finish and then restart manually to apply the changes

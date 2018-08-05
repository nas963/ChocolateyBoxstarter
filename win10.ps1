# Boxstarter options
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

# Basic setup
Update-ExecutionPolicy Unrestricted

Enable-RemoteDesktop

#--- File Explorer Settings ---
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
# will expand explorer to the actual folder you're in
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
#adds things back in your left pane like recycle bin
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
#opens PC to This PC, not quick access
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
#taskbar where window is open for multi-monitor
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2
#Disable-InternetExplorerESC # Enable Internet Explorer acces on Windows Server
#Disable-UAC # Disabled since it does not allow to start further BoxStarter thru URL
Set-TaskbarOptions -Size Large -Lock -Dock Bottom #Small

if (Test-PendingReboot) { Invoke-Reboot }

# Update Windows and reboot if necessary
# Install-WindowsUpdate -AcceptEula
if (Test-PendingReboot) { Invoke-Reboot }

#Browsers / web
cinst -y googlechrome
cinst -y firefox
cinst -y curl

#Other essential tools
cinst -y potplayer
cinst -y totalcommander
cinst -y winrar
cinst -y 7zip
cinst -y adobereader
cinst -y sumatrapdf
cinst -y lightshot
cinst -y javaruntime
cinst -y putty.install
cinst -y git.install 
cinst -y gitkraken
cinst -y cmder
cinst -y linqpad
cinst -y nodejs.install

# Visual Studio Code Extensions
cinst -y visualstudiocode --params /NoDesktopIcon
code --install-extension ms-vscode.csharp
code --install-extension loiane.angular-extension-pack

cinst -y dotnetcore-sdk

# Visual Studio 2017
cinst -y visualstudio2017community
cinst -y visualstudio2017-workload-azure
cinst -y visualstudio2017-workload-manageddesktop
cinst -y visualstudio2017-workload-netcoretools
cinst -y visualstudio2017-workload-netweb
cinst -y visualstudio2017-workload-node
cinst -y dotnetcore-sdk

cinst -y jetbrains-rider

#Cleanup the disk

# Remove update un-installers 
#Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase

# Clean the disk
##C:\Windows\System32\cleanmgr.exe /d c:

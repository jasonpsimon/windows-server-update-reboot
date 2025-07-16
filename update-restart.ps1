# Search for processes named ShooterGameServer
$processes = Get-Process -Name ShooterGameServer

# If any processes are found, kill them
if ($processes -ne $null) {
  $processes | ForEach-Object {
    $_.Kill()
  }
}

# Wait for 5 seconds
Start-Sleep -Seconds 2

# Search for processes named ArkAscendedServer
$processes = Get-Process -Name ArkAscendedServer

# If any processes are found, kill them
if ($processes -ne $null) {
  $processes | ForEach-Object {
    $_.Kill()
  }
}

# Wait for 5 seconds
Start-Sleep -Seconds 5

# Search for processes named CrossArkChat
$processes = Get-Process -Name CrossArkChat

# If any processes are found, kill them
if ($processes -ne $null) {
  $processes | ForEach-Object {
    $_.Kill()
  }
}

# Wait for 5 seconds
Start-Sleep -Seconds 5

# Ensure that PSWindowsUpdate is Installed/Loaded
Import-Module PSWindowsUpdate -Force

# Check, Download and Update Windows then Write a Log File at C:\UpdateLogs
Get-WindowsUpdate -Install -AcceptAll -AutoReboot -Verbose | Out-File "C:\UpdateLogs\$env:COMPUTERNAME - $(Get-Date -f yyyy-MM-dd) - MSUpdates.log"

# Wait for 15 minutes
Start-Sleep -Seconds 900

# Reboot the system
Restart-Computer -Force
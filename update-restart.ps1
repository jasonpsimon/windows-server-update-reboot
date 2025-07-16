#Stop All Game Servers

# Stop Ark Servers
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

# Stop ArkAscended Servers
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

# Stop CrossArkChat
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

# Stop 7D2D Servers
# Search for processes named 7DaysToDieServer
$processes = Get-Process -Name 7DaysToDieServer

# If any processes are found, kill them
if ($processes -ne $null) {
  $processes | ForEach-Object {
    $_.Kill()
  }
}

# Wait for 5 seconds
Start-Sleep -Seconds 5

# Stop Palworld Servers
# Search for processes named PalServer-Win64-Shipping-Cmd
$processes = Get-Process -Name PalServer-Win64-Shipping-Cmd

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

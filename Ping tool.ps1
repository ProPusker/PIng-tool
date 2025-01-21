Author: Your Name
    Email: propuskerworks@gmail.com
    Date: 2015-02-18
    Version: 1.0.0
    Updates: 
        - 2015-02-18: Initial version.
        - 2017-08-23: Changed the log to just write whats necessary

﻿# Configuration Section
$TargetURL = "google.com"                # URL to ping
$LogFile = Join-Path -Path $PSScriptRoot -ChildPath "PingLog.txt" # Log file path in the same folder as the script
$PingInterval = 5                         # Time (in seconds) between pings

# Initialize state
$LastState = "Unknown"  # Start with Unknown state
$InitialCheckDone = $false  # Flag to check if initial ping has been completed

# Helper function to log messages
function Write-Log {
    param (
        [string]$Message
    )
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "$Timestamp - $Message"
    $LogMessage | Out-File -Append -FilePath $LogFile
    Write-Host $LogMessage
}

# Start monitoring
Write-Log "Ping Monitor started for $TargetURL"

while ($true) {
    # First, check the current status of the target URL
    $PingResult = Test-Connection -ComputerName $TargetURL -Count 1 -Quiet

    if (-not $InitialCheckDone) {
        # Set the initial state based on the ping check
        if ($PingResult -eq $true) {
            $LastState = "Online"
            Write-Log "$TargetURL is currently online."
        } else {
            $LastState = "Offline"
            Write-Log "$TargetURL is currently offline."
        }
        $InitialCheckDone = $true  # Mark the initial check as done
        Start-Sleep -Seconds $PingInterval  # Pause before the next round
        continue  # Continue to next iteration to avoid processing
    }

    # Proceed with regular monitoring logic
    if ($PingResult -eq $true) {
        if ($LastState -ne "Online") {
            Write-Log "$TargetURL is back online."
            $LastState = "Online"
        }
    } else {
        if ($LastState -ne "Offline") {
            Write-Log "$TargetURL is currently offline."
            $LastState = "Offline"
        }
    }

    Start-Sleep -Seconds $PingInterval
}

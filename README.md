README for Ping Monitor Script

Overview

This script is a PowerShell-based **Ping Monitor** tool that continuously monitors the availability of a target URL or IP address by sending periodic pings. It logs the status changes (Online/Offline) to a log file and provides real-time feedback in the console.

Features
- Continuously monitors the target URL/IP.
- Detects and logs status changes (Online to Offline or vice versa).
- Logs each status with a timestamp.
- Customizable monitoring interval.


Requirements
- PowerShell (Version 5.1 or newer recommended).
- Proper network permissions to send ICMP (ping) requests.


Configuration
The script includes a **Configuration Section** where you can customize the behavior:

1. `$TargetURL`
   The target URL or IP address to monitor (default: `google.com`).
   
2. `$LogFile`:  
   The path to the log file where status updates will be saved. By default, it is set to `PingLog.txt` in the same directory as the script.

3. `$PingInterval`:  
   The time interval (in seconds) between each ping check (default: `5` seconds).



How to Use

1. Download the Script
   Save the script as `PingMonitor.ps1`.

2. Edit Configuration (Optional)
   Open the script in a text editor and modify the configuration section as needed:
   ```powershell
   $TargetURL = "your_target_url_or_ip"
   $PingInterval = desired_interval_in_seconds
   ```

3. Run the Script
   Open a PowerShell terminal and navigate to the folder containing the script. Execute the script using:
   ```powershell
   .\PingMonitor.ps1
   ```

   Check Logs
   The script logs all status changes and timestamps in the file `PingLog.txt` located in the script's directory.



Log File Example
The log file (`PingLog.txt`) records events in the following format:
```
2025-01-21 10:00:00 - Ping Monitor started for google.com
2025-01-21 10:00:05 - google.com is currently online.
2025-01-21 10:05:15 - google.com is currently offline.
2025-01-21 10:06:20 - google.com is back online.
```

 How It Works

1. The script begins by initializing the target URL, log file, and ping interval.
2. It performs an initial ping check to determine the current status (Online/Offline) and logs the result.
3. The script enters a continuous loop where it:
   - Sends a ping to the target.
   - Compares the current status with the previous status (`$LastState`).
   - Logs any status changes (e.g., from Online to Offline).
4. The loop continues until manually stopped (`Ctrl+C`).

Stopping the Script
To stop the script, press `Ctrl+C` in the PowerShell terminal.

 Troubleshooting

1. **Permission Issues**:  
   Ensure you run PowerShell with administrator privileges if pinging requires elevated permissions.

2. **Firewall Blocking ICMP Requests**:  
   Some firewalls may block ICMP (ping) traffic. Ensure the target device allows pings.

3. **Log File Not Generated**:  
   Verify the script has write permissions for the folder where `PingLog.txt` is created.



Customization
You can extend the script by:
- Adding email or SMS notifications on status changes.
- Monitoring multiple URLs simultaneously using parallel execution.
- Logging additional details like latency or error codes.

---

Enjoy seamless monitoring of your target URLs or IP addresses! 😊

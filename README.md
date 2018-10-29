# powershell-ping-check-with-time-stamp
Ping check with a time stamp

## timestamp-ping.ps1
This will ping a specified ip until asked to stop and will save the file to the computer. Every 100 pings it will insert a time stamp in to the file.
 
## timestamp-ping-limited.ps1
This will ping a specified ip 10 times for as many times as you tell it to. Between each set of 10, it will add a time stamp.

## Info for both files:
* By default it will create a file on the root of C so will need to be run as an Admin.
* It it's an IPv4 address, or a hostname / domain name, it will call the file that. If it’s IPv6, it will call it IPv6_Pingtest.txt.
* It will check if the file already exists, if it does, it will ask if you want to delete it or append to it.
* It you haven't already, remember to "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned"

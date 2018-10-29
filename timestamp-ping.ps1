#IP address to ping
$ip = Read-Host -Prompt 'Where would you like to ping?'

# Output file
$file = "C:\pings\" + $ip + ".txt"

if (-Not (Test-Path "C:\pings"))
{
New-Item C:\pings -type directory -Force | Out-Null
}

while ($true){
    get-date >> $file
    ping $ip -n 10 | select-string -pattern "TTL=" >> $file
    Write-Output `n | Out-File $file -Append
} 

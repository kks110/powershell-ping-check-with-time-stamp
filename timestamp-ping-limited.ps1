
#IP address to ping
$ip = Read-Host -Prompt 'Where would you like to ping?'

#Rounds of 10 pings
$rounds = Read-Host -Prompt 'How many sets of 10 pings would you like to do?'

# Output file
$file = "C:\pings\" + $ip + ".txt"

if (-Not (Test-Path "C:\pings"))
{
New-Item C:\pings -type directory -Force | Out-Null
}

while ($i -lt $rounds){
    get-date >> $file
    ping $ip -n 10 | select-string -pattern "TTL=" >> $file
    Write-Output `n | Out-File $file -Append
    $i++
} 

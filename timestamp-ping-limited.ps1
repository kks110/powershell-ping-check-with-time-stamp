#IP address to ping.
$ip = Read-Host -Prompt "Where would you like to ping?"


#If the directory doesn't exist, it creates it.
if (-Not (Test-Path "C:\pings"))
{
    New-Item C:\pings -type directory -Force | Out-Null
}


#Determines if its IPv4 or 6 and determines the file name.
if ($ip -like '*:*') {
    $ipv = "-6"
    $file = "C:\pings\IPv6_Pingtest.txt"
} else {
    $ipv = "-4"
    $file = "C:\pings\" + $ip + ".txt"
}

# Checks to see if the file already exsist and asks if you want to delete it.
if (Test-Path $file) {
    "It looks like " + $file + " already exists"
    $YorN = Read-Host -Prompt "would you like to delete it? (if no, it will append) (Y/N)"
    if ($YorN -like '*y*') {
        Remove-Item -path $file
    }
}

#Rounds of 10 pings.
$rounds = Read-Host -Prompt 'How many sets of 10 pings would you like to do?'

"Starting Test:"
$i = 0

#Pings and outputs to the file.
while ($i -lt $rounds){
    get-date >> $file
    ping $ip $ipv -n 10 | select-string -pattern Reply,Request >> $file
    Write-Output `n | Out-File $file -Append
    $i++
    "Round " + $i + " of pings complete."
} 

"Script complete. Please see " + $file + " for results."

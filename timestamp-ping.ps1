#IP address to ping.
$ip = Read-Host -Prompt 'Where would you like to ping?'


#If the directory doesn't exist, it creates it.
if (-Not (Test-Path "C:\pings"))
{
    New-Item C:\pings -type directory -Force | Out-Null
}


#Determines if its IPv4 or 6 and determines file name.
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


#Pings and outputs to the file.
"Running test, please press Ctrl + C, or close this window to stop it"
while ($true){
    get-date >> $file
    ping $ip $ipv -n 100 | select-string -pattern Reply,Request >> $file
    Write-Output `n | Out-File $file -Append
} 

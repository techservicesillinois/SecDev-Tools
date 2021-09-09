<#
    This script will check a given CSV of IPs to see if any are within campus subnets. It expects a column named "ip"

    Red/Green output will print out. Red is inclusion green is exclusion.
#>

$Path = "C:\file.csv"
$IPs = Import-Csv -Path $Path

# https://answers.uillinois.edu/47572
$CampusSubnets = (
    "72.36.64.0/18",
    "128.174.0.0/16",
    "130.126.0.0/16",
    "192.17.0.0/16",
    "10.192.0.0/10",
    "172.16.0.0/13",
    "64.22.176.0/20",
    "204.93.0.0/19",
    "141.142.0.0/16",
    "198.17.196.0/25",
    "172.24.0.0/13",
    "128.248.0.0/16",
    "131.193.0.0/16",
    "192.43.252.0/24",
    "69.67.112.0/20",
    "192.102.230.0/24",
    "65.79.120.0/22",
    "64.107.204.0/22",
    "209.7.170.0/24",
    "192.207.162.0/24",
    "72.36.120.0/21"
)

foreach($SubnetStr in $CampusSubnets){
    [System.Net.IPAddress]$Subnet = $SubnetStr.Split('/')[0]
    $MaskLength = $SubnetStr.Split('/')[1]
    $CIDR_Bits = ('1' * $MaskLength).PadRight(32, "0")
    $Octets = $CIDR_Bits -split '(.{8})' -ne ''
    $Mask = ($Octets | ForEach-Object -Process {[Convert]::ToInt32($_, 2) }) -join '.'
    [System.Net.IPAddress]$SubnetMask = $Mask

    foreach($IP in $IPs){
        [System.Net.IPAddress]$IPAddress = $IP.ip
        if($Subnet.Address -eq ($IPaddress.Address -band $SubnetMask.Address)){
            Write-Host "$($IP.ip) part of $($SubnetStr)" -ForegroundColor 'red'
        }
        else{
            # comment the bottom line out if you want to limit spam and only see inclusions
            Write-Host "$($IP.ip) not part of $($SubnetStr)" -ForegroundColor 'green'
        }
    }
}

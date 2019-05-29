param (
    [Parameter(Mandatory=$true)][string]$dnsServer
 )

$domainRecord = "www.google.com"
$Stoploop = $false
[int]$Retrycount = "0"

do
    {
        try
            {
                $bla = Resolve-DnsName $domainRecord -Server $dnsServer -ErrorAction Stop
                $time = (Get-Date -Format HH:mm:ss).ToString()
                Write-Output "$time - It's working"
                $Stoploop = $true
            }
        catch
            {

            $time = (Get-Date -Format HH:mm:ss).ToString()
            Write-Output "$time - DNS IS NOT WORKING, ATTEMPT #$Retrycount"
            Start-Sleep -Seconds 5
            $Retrycount = $Retrycount + 1
             }
    }
While ($Stoploop -eq $false)

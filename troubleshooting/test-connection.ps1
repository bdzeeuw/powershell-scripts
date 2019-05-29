$server = 'www.google.com'
$port = '80'

try {
    $bla = Test-NetConnection -ComputerName $server -Port $port -ErrorAction Stop
	$bla.TcpTestSucceeded
    }
catch {
    $time = (Get-Date -Format HH:mm:ss).ToString()
	Write-Output "$time - Error in doing TCP Test"
    }

if ($bla.TcpTestSucceeded -eq $false)
{
    $Stoploop = $false
    [int]$Retrycount = "0"
    do
    {
        $bla2 = Test-NetConnection -ComputerName $server -Port $port -ErrorAction Stop
        if ($bla2.TcpTestSucceeded -eq $true)
        {
            $Stoploop = $true
        }
        else {
            Start-Sleep -Seconds $SleepinSeconds
            $Retrycount = $Retrycount + 1
        }

    }
    While ($Stoploop -eq $false)
}

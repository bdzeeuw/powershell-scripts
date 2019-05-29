
$from = "SMTP Test <sendgrid-poc@contoso.com>"
$to = "bas.de.zeeuw@contoso.com"
$currdate = get-date -format yyyy-MM-dd-HHmm
$subject = "$currdate - Test mail"
$body = "This is a test mail sent using Sendgrid"
$smtp = "smtp.sendgrid.net"
$port = '587'
$username = "apikey"
$password = "<apikey>" | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username,$password)

Try
    {
    Send-MailMessage -From $from `
                    -To $to `
                    -Subject $subject `
                    -Body $body `
                    -Priority High `
                    -DeliveryNotificationOption OnSuccess, OnFailure `
                    -Credential $credential `
                    -Port $port `
                    -SmtpServer $smtp `
                    -ErrorAction Stop
    }
Catch
{
    Write-Output $_.Exception | format-list -force
}

<#
    Retrieves password record from Passwordstate
    Example: $creds = Get-Passwordstate -id <ID> -apikey <APIKEY>
#>

param(
    [Parameter(Mandatory=$True,
    Position=0,
    HelpMessage="Enter the password ID")]
    [string]
    $id,

    [Parameter(Mandatory=$True,
    Position=1,
    HelpMessage="Enter the API key")]
    [string]
    $apikey
)

#Import Get-Password function
. .\get-password.ps1

$PasswordstateCreds = Get-Passwordstate -id $id -apikey $apikey 
$User = $PasswordstateCreds.Username
$Password = ConvertTo-SecureString -String $PasswordstateCreds.Password -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential ($User, $Password)

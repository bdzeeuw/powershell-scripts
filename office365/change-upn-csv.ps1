$UserCredential = Get-Credential
Connect-MsolService -Credential $UserCredential
$UserAccounts = Import-Csv -Delimiter "," -Path(".\UserAccounts.csv")
Foreach ($user in $UserAccounts)
{
    Set-MsolUserPrincipalName -UserPrincipalName $_.UserPrincipalName -NewUserPrincipalName $_.NewUserPrincipalName
}
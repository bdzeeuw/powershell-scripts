
<#
    Retrieves password record from Passwordstate
    Example: $creds = Get-Passwordstate -id <ID> -apikey <APIKEY>
#>

function Get-Passwordstate {

    [CmdletBinding()]
    Param
    (
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
	
	$url = 'https://passwordstate.contoso.com/api/passwords'
	
    Invoke-RestMethod -Uri $url/$($id)?apikey=$($apikey) -Method Get

}
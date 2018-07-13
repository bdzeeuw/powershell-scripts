$CurrentDir = (Get-Item .).FullName
$DirList = (Get-ChildItem -Recurse `
                         -Force `
                         -Directory '.git' `
                         -ErrorAction Stop).FullName
$Path = Convert-Path (Split-Path -Path $Dirlist -Parent)                         

ForEach ($dir in $Path)
{
    $null = Set-Location -Path $dir `
                         -ErrorAction Stop
    $git_branch = git rev-parse --abbrev-ref HEAD                   
    $git_output = git pull
    Write-Host "$dir -" $git_branch "-" $git_output
}
Set-Location -Path $CurrentDir
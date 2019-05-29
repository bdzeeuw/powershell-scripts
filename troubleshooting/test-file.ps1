
function Write-PipelineStepMessage
{
    [CmdletBinding()]
    param
    (
        [Parameter(Position = 0, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Message
    )

    $verboseMessage = (Get-Date -Format HH:mm:ss:ms).ToString() + ' - Step: {0}' -f $Message

    Write-Output -InputObject $verboseMessage
}

Write-PipelineStepMessage -Message 'Starting Script'

$sourceFolder = 'P:\'
$sourceFile = 'file1.bin'
$sourcePath = $sourceFolder + $sourceFile
$destinationFile = 'file1.bin'
$destinationFolder = "D:\bas-dest\$($destinationFile)"


if (Test-Path $destinationFolder )
{
        Write-PipelineStepMessage -Message "Test file already exists in $destinationFolder, cleaning up"
        Remove-Item –path $destinationFolder
}
else
{
    Write-PipelineStepMessage -Message "Test file not present yet, starting test with $destinationFolder"
}

if (Test-Path $sourcePath )
{
Write-PipelineStepMessage -Message "$sourcePath exists.. starting copy"
Copy-Item -Path $sourcePath -Destination $destinationFolder -ErrorAction Stop
    if (Test-Path $destinationFolder )
    {
         $size = Get-ChildItem -Path $destinationFolder
         Write-PipelineStepMessage -Message "Copy to $destinationFolder completed, filesize: $($size.Length/1MB) MB"
    }
    else
    {
        Write-PipelineStepMessage -Message "$destinationFolder not found"
    }
    }
else
{
Write-Output "File not present"
}

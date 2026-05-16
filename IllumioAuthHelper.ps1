function Get-IllumioAuthHeader {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ApiKeyId,
        
        [Parameter(Mandatory=$true)]
        [string]$ApiSecret
    )

    $Pair = "$($ApiKeyId):$($ApiSecret)"
    $Bytes = [System.Text.Encoding]::ASCII.GetBytes($Pair)
    $Base64 = [Convert]::ToBase64String($Bytes)
    
    return @{
        "Authorization" = "Basic $Base64"
        "Accept"        = "application/json"
    }
}

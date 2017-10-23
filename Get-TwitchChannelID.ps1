
    Param (
        [Parameter(Mandatory=$True)]
        [String]$channel
    )

    $clientID = "YOUR CLIENT ID GOES HERE"
    $userAgent = "PowerShell GetChannelID"
    $apiUrl = "https://api.twitch.tv/kraken/users?login="
    $headers = @{
        "Client-ID" = $ClientID;
        "Accept" = "application/vnd.twitchtv.v5+json"
    }
    
    $requestUrl = $apiUrl + $channel

    $apiResult = Invoke-RestMethod -Uri $requestUrl -Method Get -UserAgent $userAgent -Headers $headers
    if ($apiResult) {
        return $apiResult.users._id
    } else {
        Write-Warning "errrrrrrrrrrr"
        return
    }


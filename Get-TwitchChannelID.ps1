
    Param (
        [Parameter(Mandatory=$True)]
        [String]$channel
    )

    $clientID = "sw19g2vrz9nkugaviab9xbk6w7ehxxh"
    $userAgent = "PowerShell GetChannelID"
    #$game = [System.Web.HttpUtility]::UrlEncode($gameName);
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
        Write-Warning "Sorry, but there was a problem with the last twitch.tv API call."
        return
    }


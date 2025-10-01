function GetStoreFilePath {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$SynchronizationKey,

        [Parameter(Mandatory = $true)]
        [string]$StoreName,

        [Parameter(Mandatory = $false)]
        [string]$BasePath = "$($ENV:LOCALAPPDATA)\GenXdev.PowerShell\KeyValueStore"
    )

    # sanitize filename components to remove invalid characters
    $safeSyncKey = $SynchronizationKey -replace '[\\/:*?"<>|]', '_'
    $safeStoreName = $StoreName -replace '[\\/:*?"<>|]', '_'

    # construct filename: SyncKey_StoreName.json
    $filename = "${safeSyncKey}_${safeStoreName}.json"

    # return full path
    return [System.IO.Path]::Combine($BasePath, $filename)
}

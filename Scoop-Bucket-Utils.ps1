Param(
    [Parameter(Mandatory)]
    [ValidateSet('CheckHashes','CheckUrls', 'CheckVer', 'Describe', 'FormatJson', 'MissingCheckVer', 'Tests')]
    $Utility
)

if (!$env:SCOOP_HOME) {
    $env:SCOOP_HOME = Resolve-Path (scoop.ps1 prefix scoop)
}

"Running $Utility ..."
''

switch ($Utility) {
    'CheckHashes' {
        # Check if ALL urls inside manifest have correct hashes.
        # Can pass "-Update" to update mismatched hashes.
        . "$env:SCOOP_HOME/bin/checkhashes.ps1" -Dir './bucket' -SkipCorrect
    }
    'CheckUrls' {
        # List manifests which do not have valid URLs.
        . "$env:SCOOP_HOME/bin/checkurls.ps1" -Dir './bucket' -SkipValid
    }
    'CheckVer' {
        # Check manifest for a newer version.
        # Can pass "-Update" to update given manifest.
        . "$env:SCOOP_HOME/bin/checkver.ps1" -Dir './bucket' -SkipUpdated
    }
    'Describe' {
        # Search for application description (typically 'og:description') on homepage.
        . "$env:SCOOP_HOME/bin/describe.ps1" -Dir './bucket'
    }
    'FormatJson' {
        # Format manifest.
        . "$env:SCOOP_HOME/bin/formatjson.ps1" -Dir './bucket'
    }
    'MissingCheckVer' {
        # Check if manifest contains checkver and autoupdate property.
        . "$env:SCOOP_HOME/bin/missing-checkver.ps1" -Dir './bucket' -SkipSupported
    }
    'Tests' {
        # First, remove the built-in (old) version of Pester:
        #
        # $module = "C:\Program Files\WindowsPowerShell\Modules\Pester"
        # & takeown.exe /F $module /A /R
        # & icacls.exe $module /reset
        # & icacls.exe $module /grant "*S-1-5-32-544:F" /inheritance:d /T
        # Remove-Item -Path $module -Recurse -Force -Confirm:$false
        . "$env:SCOOP_HOME/test/Import-Bucket-Tests.ps1" -BucketPath './bucket'
    }
}

''
'Done.'

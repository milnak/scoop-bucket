<#
.SYNOPSIS
    Utilities to assist with developing a scoop bucket.
.DESCRIPTION
    Wrapper for built-in scoop utilities.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    See tool sources at https://github.com/ScoopInstaller/Scoop/tree/master/bin
.EXAMPLE
    ./Scoop-Bucket-Utils.ps1 -Utilities CheckVer
    Check manifests for updated versions.

.EXAMPLE
    ./Scoop-Bucket-Utils.ps1 -Utilities Tests
    Run manifest tests on all manifests in this folder.
.EXAMPLE
    ./Scoop-Bucket-Utils.ps1 -All
    Run all of the utilities on all manifests in this folder.
#>

Param(
    # CheckHashes - Check if ALL urls inside manifest have correct hashes.
    # CheckUrls - List manifests which do not have valid URLs.
    # CheckVer - Check manifest for a newer version.
    # FormatJson - Format manifest.
    # MissingCheckVer - Check if manifest contains checkver and autoupdate property.
    # Tests - Run manifest tests.
    [Parameter(Mandatory)]
    [ValidateSet('CheckHashes', 'CheckUrls', 'CheckVer', 'Describe', 'FormatJson', 'MissingCheckVer', 'Tests')]
    [string[]]$Utilities
)

if (!$env:SCOOP_HOME) {
    $env:SCOOP_HOME = Resolve-Path (scoop.ps1 prefix scoop)
}

foreach ($Utility in $Utilities) {
    "Running $Utility ..."
    ''

    switch ($Utility) {
        'CheckHashes' {
            # Can pass "-Update" to update mismatched hashes.
            . "$env:SCOOP_HOME/bin/checkhashes.ps1" -Dir './bucket' -SkipCorrect
        }
        'CheckUrls' {
            . "$env:SCOOP_HOME/bin/checkurls.ps1" -Dir './bucket' -SkipValid
        }
        'CheckVer' {
            # "-Update": update given manifest.
            . "$env:SCOOP_HOME/bin/checkver.ps1" -Update -Dir './bucket'
        }
        'Describe' {
            . "$env:SCOOP_HOME/bin/describe.ps1" -Dir './bucket'
        }
        'FormatJson' {
            . "$env:SCOOP_HOME/bin/formatjson.ps1" -Dir './bucket'
        }
        'MissingCheckVer' {
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
}

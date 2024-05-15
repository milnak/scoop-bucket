Param(
    [Parameter(Mandatory)]
    [ValidateSet('CheckUrls', 'CheckVer', 'FormatJson', 'MissingCheckVer', 'Tests')]
    $Utility
)

if (!$env:SCOOP_HOME) {
    $env:SCOOP_HOME = Resolve-Path (scoop.ps1 prefix scoop)
}

"Running $Utility ..."
''

switch ($Utility) {
    'CheckUrls' {
        . "$env:SCOOP_HOME/bin/checkurls.ps1" -Dir './bucket'
    }
    'CheckVer' {
        . "$env:SCOOP_HOME/bin/checkver.ps1" -Dir './bucket'
    }
    'FormatJson' {
        . "$env:SCOOP_HOME/bin/formatjson.ps1" -Dir './bucket'
    }
    'MissingCheckVer' {
        . "$env:SCOOP_HOME/bin/missing-checkver.ps1" -Dir './bucket'
    }
    'Tests' {
        # To remove the built-in (old) version of Pester:
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

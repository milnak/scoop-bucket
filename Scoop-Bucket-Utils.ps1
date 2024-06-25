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
    ./Scoop-Bucket-Utils.ps1 -Utility CheckHashes,CheckUrls,CheckVer,FormatJson,MissingCheckVer -App cemu
    Runs several utilities on 'cemu' manifest.

.EXAMPLE
    ./Scoop-Bucket-Utils.ps1 -Utility CheckVer
    Checks for updated versions of apps in manifests. Updates manifest(s) if needed.

.EXAMPLE
    ./Scoop-Bucket-Utils.ps1 -Utility Tests
    Run manifest tests on all manifests in this folder.
#>

param(
  # CheckHashes - Check if ALL urls inside manifest have correct hashes.
  # CheckUrls - List manifests which do not have valid URLs.
  # CheckVer - Check manifest for a newer version.
  # Describe - Retrieve description from website's metadata.
  # FormatJson - Format manifest.
  # MissingCheckVer - Check if manifest contains checkver and autoupdate property.
  # Tests - Run manifest tests.
  [Parameter(Mandatory)]
  [ValidateSet('CheckHashes','CheckUrls','CheckVer','Describe','FormatJson','MissingCheckVer','Tests')]
  [string[]]$Utility,
  # App to check (optional).
  [string]$App,
  # Directory containing manifests.
  [string]$Dir = './bucket'
)

if (!$env:SCOOP_HOME) {
  $env:SCOOP_HOME = Resolve-Path (scoop.ps1 prefix scoop)
}

foreach ($UtilityName in $Utility) {
  "Running $UtilityName ..."
  ''

  $UtilityNameArguments = @{ 'Dir' = $Dir }
  if ($App) { $UtilityNameArguments += @{ 'App' = $App } }

  switch ($UtilityName) {
    'CheckHashes' {
      # "-Update": update mismatched hashes.
      . "$env:SCOOP_HOME/bin/checkhashes.ps1" -Update @UtilityNameArguments
    }
    'CheckUrls' {
      . "$env:SCOOP_HOME/bin/checkurls.ps1" @UtilityNameArguments
    }
    'CheckVer' {
      # "-Update": update given manifest.
      . "$env:SCOOP_HOME/bin/checkver.ps1" -Update @UtilityNameArguments
    }
    'Describe' {
      # Get-ChildItem $Dir -Filter '*.json' -File `
      # | ForEach-Object {
      #     $d=Get-Content $_ | ConvertFrom-Json | Select-Object -ExpandProperty description
      #     "$($_.BaseName):"
      #     Write-Host -ForegroundColor Green "  $d" }
      # ''

      . "$env:SCOOP_HOME/bin/describe.ps1" @UtilityNameArguments
    }
    'FormatJson' {
      . "$env:SCOOP_HOME/bin/formatjson.ps1" @UtilityNameArguments
    }
    'MissingCheckVer' {
      . "$env:SCOOP_HOME/bin/missing-checkver.ps1" @UtilityNameArguments
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

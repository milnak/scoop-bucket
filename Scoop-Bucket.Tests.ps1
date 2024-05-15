# To remove the built-in (old) version of Pester:
#
# $module = "C:\Program Files\WindowsPowerShell\Modules\Pester"
# & takeown.exe /F $module /A /R
# & icacls.exe $module /reset
# & icacls.exe $module /grant "*S-1-5-32-544:F" /inheritance:d /T
# Remove-Item -Path $module -Recurse -Force -Confirm:$false

'BuildHelpers','Pester' | ForEach-Object {
    if (!(Get-Module -ListAvailable -Name $_)) {
        ('Module not installed. Try "Install-Module -Name {0}"' -f $_)
        return
    }
}

''
if (!$env:SCOOP_HOME) { $env:SCOOP_HOME = Resolve-Path (scoop.ps1 prefix scoop) }
. "$env:SCOOP_HOME\test\Import-Bucket-Tests.ps1" -BucketPath .

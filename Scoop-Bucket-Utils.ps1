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
    # CreateGitCommitMessage - Create a git commit message for changes in the bucket.
    [Parameter(Mandatory)]
    [ValidateSet('CheckHashes', 'CheckUrls', 'CheckVer', 'Describe', 'FormatJson', 'MissingCheckVer', 'Tests', 'CreateGitCommitMessage')]
    [string[]]$Utility,
    # App to check (optional).
    [string]$App,
    # Directory containing manifests.
    [string]$Dir = './bucket'
)

function Set-GitCommitMessage {
    <#
    .SYNOPSIS
        Builds a manifest-based commit message and commits all staged changes.
    .DESCRIPTION
        Lists staged JSON manifests in the subject and summarizes their working-tree
        versions alongside versions from their latest commits in the message body.
        If nothing is staged, displays the repository status and returns.
    #>

    # Check for staged changes without printing the diff.
    git.exe diff --cached --quiet
    # Git exits with zero when the index matches HEAD.
    if ($LASTEXITCODE -eq 0) {
        Write-Host -Foreground  Yellow "No changes staged for commit."
        # Display the concise status of staged, unstaged, and untracked files.
        git.exe status --short
        # Leave the function without creating a commit.
        return
    }

    # Initialize the commit subject with a change-type prefix.
    $subject = 'modified: '

    # Initialize the commit message body.
    $description = ''

    # List staged JSON paths, excluding deleted files.
    $changedFiles = git.exe diff --cached --name-only --diff-filter=d | Where-Object { $_ -match '\.json$' }

    # Build message entries for each staged JSON file.
    foreach ($file in $changedFiles) {
        # Derive the manifest ID by removing the bucket prefix and JSON suffix.
        $id = $file -replace 'bucket/', '' -replace '.json', ''
        # Append the manifest ID and a separating space to the subject.
        $subject += "$id "
        # Read and parse the file from the latest commit that changed its path.
        $previous = git.exe show ('{0}:{1}' -f (git.exe log --pretty=format:'%H' -1 $file), $file) | ConvertFrom-Json
        # Read and parse the working-tree file, which may differ from the staged copy.
        $current = Get-Content $file | ConvertFrom-Json
        # Append the manifest ID, working-tree version, and previous version to the body.
        $description += "{0}: {1} (scoop version is {2})`n" -f $id, $current.version, $previous.version

    }
    # Commit all staged changes using the subject and body separated by a blank line.
    git commit -m "$subject`n`n$description"

    # Display the latest commit.
    git log -1

    Write-Host 'Done. Use ''git commit --amend'' to modify the commit if needed.'
}

# -----------------------------------------------------------------------------
# MAIN

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
        'CreateGitCommitMessage' {
            Set-GitCommitMessage
        }
    }

    ''
    'Done.'
}

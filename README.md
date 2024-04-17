# Milnak's Scoop Bucket

Note that most of these are in progress. Do not rely on these to work!

## Add bucket

`scoop bucket add milnak https://github.com/milnak/scoop-bucket`

## Check that it works

`scoop bucket list`

Should see something like:

```text
Name         Source                                         Updated               Manifests
----         ------                                         -------               ---------
milnak       https://github.com/milnak/scoop-bucket         2/1/2024 11:43:26 AM          0
```

## Search for app

`scoop search clonespy`

Should see something like:

```text
Name     Version Source Binaries
----     ------- ------ --------
CloneSpy 3.43    milnak
```

## Install app

`scoop install milnak/clonespy`

## Run app

`CloneSpy64.exe`

## More Info

To refresh bucket cache:

```PowerShell
scoop update
```

To verify update scripts:

```PowerShell
~\scoop\apps\scoop\current\bin\checkver.ps1 -Dir .

# or

~\scoop\apps\scoop\current\bin\checkver.ps1 -App .\winsetview.json
```

**Note:** "scoop update" will update the app when it detects a change in the manifest in the upstream bucket repository. It has nothing to do with checkver. "autoupdate" is just for checkver. You have to run checkver periodically to update the manifest. "Checkver -Update" will update the manifest with new version to be pushed to repository.

To get file hash for "hash" field:

```PowerShell
(Get-FileHash -Algorithm SHA256 '.\xscsetup-9.40.0.exe').Hash
```

Links:

[App Manifests Wiki](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests)

[Buckets Wiki](https://github.com/ScoopInstaller/Scoop/wiki/Buckets)

[Main Bucket](https://github.com/ScoopInstaller/Main/tree/master/bucket)

[Extras Bucket](https://github.com/ScoopInstaller/Extras/tree/master/bucket)

# Milnak's Scoop Bucket

Stuff that I use that isn't in the official scoop buckets.

## Getting Started

### Add bucket

`scoop bucket add milnak https://github.com/milnak/scoop-bucket`

### Check that it works

`scoop bucket list`

Should see something like:

```text
Name         Source                                         Updated               Manifests
----         ------                                         -------               ---------
milnak       https://github.com/milnak/scoop-bucket         2/1/2024 11:43:26 AM          0
```

### Search for app

`scoop search windbg`

Should see something like:

```text
Name   Version        Source Binaries
----   -------        ------ --------
windbg 1.2402.24001.0 milnak
```

### Install app

`scoop install milnak/windbg`

### Run app

`windbg.exe`

## Manifest Notes

### chordpro.json

checkver.github uses regex '/releases/tag/(?:v|V)?([\\d.]+)', but ChordPro uses R6.050 !

minor is '050' but installer uses '50'

### clonespy.json

This is a nullsoft installer, which is 7zip-wrapped.

### ctrlr.json

Ctrlr-5.3.201.exe is a nullsoft (7-zip) installer.

### grief.json

checkver.github uses regex '/releases/tag/(?:v|V)?([\\d.]+)', but grief uses '3.2.3-build-26'.

See ~/scoop/apps/scoop/current/lib/autoupdate.ps1 - $versionVariables.

### knobkraftorm.json

innounp.exe -v ./knobkraft_orm_setup_2.3.0.exe

### midi-ox.json

midioxse.exe is a self-extracting zip containing a MSI file.

Expand-MsiArchive - see [this](https://github.com/ScoopInstaller/Scoop/blob/4a31bd330244f7f89f16208cdddda3f9edac2d65/lib/decompress.ps1#L127).

### portable-build-tools.json

I add a pbtdevenv.ps1 -- see [Create PowerShell environment script as well](https://github.com/Data-Oriented-House/PortableBuildTools/issues/6).

Need to create script as part of pre_install, not post_install as "bin" references it before post_install occurs.

If msvc or SDK version changes, modify `msvc=` `sdk=` `$env:WindowsSDKVersion` and `$env:VCToolsInstallDir`.

Not currently removing c:\BuildTools as part of uninstall.

### synthtribe.json

Found this path using dev tools while loading [this](https://www.behringer.com/product.html?modelCode=0722-ABR).

### usbdeview.json

This is a fixed version of the manifest that's in nirsoft bucket. scoop is case-sensitive on filenames!

Also, scoop persist requires a file to exist in $dir at install time, or it will be assumed that the object is a folder, so New-Item is used to create an empty file.

### windbg.json

Derived from 'winget show Microsoft.windbg'.

## Development Notes

For development purposes, this repo should be cloned into `~/scoop/buckets/milnak`.

I've created a script "Scoop-Bucket-Utils.ps1" that wraps all of the relevant development scripts.  When adding a new script, run `./Scoop-Bucket-Utils.ps1 -Utility CheckHashes,CheckUrls,CheckVer,FormatJson,MissingCheckVer -App [manifest_name]` to verify manifest, then `./Scoop-Bucket-Utils.ps1 -Utility Tests` to run UTs.

To refresh bucket cache:

```PowerShell
scoop update
```

"scoop update" will update the app when it detects a change in the manifest in the upstream bucket repository. It has nothing to do with checkver. "autoupdate" is just for checkver. You have to run checkver periodically to update the manifest.

To get file hash for "hash" field:

```PowerShell
(Get-FileHash -Algorithm SHA256 '.\xscsetup-9.40.0.exe').Hash
```

## References

[App Manifests Wiki](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests)

[Buckets Wiki](https://github.com/ScoopInstaller/Scoop/wiki/Buckets)

[Main Bucket](https://github.com/ScoopInstaller/Main/tree/master/bucket)

[Extras Bucket](https://github.com/ScoopInstaller/Extras/tree/master/bucket)

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

After determining a regular expression at [regex101](https://regex101.com/), convert it to a JSON string using e.g.:

```PowerShell
'<a href="\/documents\/2393\/GuitarLab_Win_v([\d\.]+)_E\.zip">' | ConvertTo-Json
```

### cemu.json

I tried creating a `cemu_config.ini` and adding  `"persist": "cemu_config.ini"`, to force portable mode, but couldn't get it to work, as I think that cemu is deleting the .ini file which loses the SymbolicLink.  I've created a hack to workaround this.

cemu places all files in same location as cemu_config.ini, so by passing persist_dir to "--settings", all of the other files (e.g. cemu_image.ce) will be placed in persist folder as well.

### chordpro.json

checkver.github uses regex '/releases/tag/(?:v|V)?([\\d.]+)', but ChordPro uses R6.050 !

minor is '050' but installer uses '50'

### clonespy.json

This is a nullsoft installer, which is 7zip-wrapped.

### ctrlr.json

Ctrlr-5.3.201.exe is a nullsoft (7-zip) installer.

### foobar2000-preview

Latest foobar2000 version.

### grief.json

checkver.github uses regex '/releases/tag/(?:v|V)?([\\d.]+)', but grief uses '3.2.3-build-26'.

Thanks, [JSONPath Online Evaluator](https://jsonpath.com/)!

See ~/scoop/apps/scoop/current/lib/autoupdate.ps1 - $versionVariables.

### insideclipboard.json

Similar to nirsoft/insideclipboard, but this persists configuration.

### jjazzlab.json

Version is 4.1.0, but download path is "/4.1.0/JJazzLab-4.1.0a-win64-setup.exe".  Use api.github to get browser_download_url with a regex to match version ("4.1.0") and build ("4.1.0a").

Hash will search for hash pattern, e.g. "md5sum: 7b22dfef0c319daca8c1202f12592f24" on URL. See [Using Built-in RegEx in autoupdate.hash](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifest-Autoupdate).

### knobkraftorm.json

`"checkver": "github",` should suffice, but a 2.3.2 only for MacOS was released which caused CheckVer to fail.

Add requirement for [versions/innounp-unicode](https://github.com/ScoopInstaller/Scoop/issues/6157)

### midi-ox.json

midioxse.exe is a self-extracting zip containing a MSI file.

Expand-MsiArchive - see [this](https://github.com/ScoopInstaller/Scoop/blob/4a31bd330244f7f89f16208cdddda3f9edac2d65/lib/decompress.ps1#L127).

MIDI-OX showed invalid install without a personal license added, so if no license is set, registry keys will be set to personal license by default.

### notepad4.json

Scoop's [notepad2-zufuliu](https://github.com/ScoopInstaller/Extras/blob/fb21864016f4955413bb8d476bad46ca80001786/bucket/notepad2-zufuliu.json) is out of date. This is up to date.

### plus42.json

I'm creating an empty "state.bin" file but that causes "State File Corrupt" to be
displayed when starting Plus42. This goes away on any keypress.

### portable-build-tools.json

On a clean (Windows Sandbox) VM, PortableBuildTools.exe wasn't located.  In post_install, I changed "PortableBuildTools.exe" to "& (Join-Path $dir 'PortableBuildTools.exe')" to fix this issue.

My devenv.ps1 script is now integrated into the installer, so I removed my post_install that would create one.

I also added a shortcut to the devenv.ps1.  Had to do a "pre_install" hack as "shortcuts" will only add a shortcut to an item in the install folder it seems.

PortableBuildTools.exe fails if install path includes a SymbolicLink, which scoop uses.  To work around that, I reference `$original_dir` instead of `$dir` during install.

### romcenter.json

Didn't add "bin": [ "datutil.exe", "rc.exe" ] as I don't think these tools are commonly used.

### superputty.json

Similar to the one in extras, but this one stores SuperPuTTY.settings in a persist folder rather than under $env:USERPROFILE

### sweethome3d.json

Contains [persistence bug](https://github.com/ScoopInstaller/Extras/issues/13548) fix.

### synthtribe.json

Found this path using dev tools while loading [this](https://www.behringer.com/product.html?modelCode=0722-ABR).

### umi-ocr.json

Persists settings, avoiding [known issue](https://github.com/ScoopInstaller/Extras/issues/13707)

### usbdeview.json

This is a fixed version of the manifest that's in nirsoft bucket. scoop is case-sensitive on filenames!

Also, scoop persist requires a file to exist in $dir at install time, or it will be assumed that the object is a folder, so New-Item is used to create an empty file.

### vs-build-tools-2022

Based on: [Visual Studio VC Build Tools w/vcpkg, CMake and Ninja, plus Qt](https://gist.github.com/milnak/67e5b7bf036c26827a8eee2911028e37)

--includeRecommended includes CMake which is required for vcpkg to work, however that CMake is an older version.  Installing main/cmake will install  a newer version.

The build tools installer adds start menu shortcuts for:

* Developer Command Prompt for VS 2022
* Developer PowerShell for VS 2022
* x86 Native Tools Command Prompt for VS 2022 (component not installed)
* x64_x86 Cross Tools Command Prompt for VS 2022 (component not installed)

You can also open the Developer PowerShell using:

```PowerShell
Import-Module (Join-Path (scoop prefix 'vs-build-tools-2022') '\vs\Common7\Tools\Microsoft.VisualStudio.DevShell.dll')

# Can't use `Join-Path (scoop prefix 'vs-build-tools-2022') 'vs'` as the scoop junction causes the lookup to fail.
Enter-VsDevShell -VsInstallPath (Resolve-Path '~\scoop\apps\vs-build-tools-2022\17.12\vs')
```

If using [vcpkg](https://learn.microsoft.com/en-us/vcpkg/get_started/overview), ensure that `CMAKE_TOOLCHAIN_FILE` is set:

```PowerShell
$env:CMAKE_TOOLCHAIN_FILE="$env{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
```

References:

* [Use command-line parameters to install, update, and manage Visual Studio](https://learn.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio?view=vs-2022)
* [Visual Studio Build Tools component directory](https://learn.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-build-tools?view=vs-2022)

### wabbitemu.json

See [rom_path getting corrupted in wabbitemu.ini (Windows)](https://github.com/sputt/wabbitemu/issues/36) -- a file "currentwabbitemu.sav" will be placed ion ~/scoop/apps/wabbitemu because of this bug.

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

## Determining installer type

Try:

* trid filename - "scoop install main/trid"
* 7z l filename - "scoop install main/7zip"
  * If you see "$PLUGINSDIR", it might be NSIS (NullSoft installer)
* dark filename - "scoop install main/dark"
* lessmsi o filename - "scoop install main/lessmsi"
* unzip filename - "scoop install main/unzip"

## References

[App Manifests](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifests)

[App Manifest Autoupdate](https://github.com/ScoopInstaller/Scoop/wiki/App-Manifest-Autoupdate)

[Buckets Wiki](https://github.com/ScoopInstaller/Scoop/wiki/Buckets)

[Main Bucket](https://github.com/ScoopInstaller/Main/tree/master/bucket)

[Extras Bucket](https://github.com/ScoopInstaller/Extras/tree/master/bucket)

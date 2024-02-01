# Milnak's Scoop Bucket

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

[Buckets Wiki](https://github.com/ScoopInstaller/Scoop/wiki/Buckets)


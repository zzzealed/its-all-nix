# It's a piece of fucking shit but it works. Hardlinks for files, and regular symlinks for dirs. Because otherwise it blows the fuck up :)))

# Git
## Ensure original config file exists
$original = "..\..\shared\home-manager\git\config\.gitconfig"
if (-not (Test-Path $original)) {
    New-Item -Path $original -ItemType File -Force | Out-Null
}
## Backup existing file at link path, if present
$hardlink = "$HOME\.gitconfig"
if (Test-Path $hardlink) {
    Rename-Item -Path $hardlink -NewName "$hardlink.bak" -Force
}
## Create a hardlink for config file
cmd /c mklink /H $hardlink $original

# MPV config
## Backup previous config
$original = "..\..\shared\home-manager\mpv\config"
if (-not (Test-Path $original)) {
    New-Item -Path $original -ItemType Directory -Force | Out-Null
}
$symlink = "$env:APPDATA\mpv"
if (Test-Path $symlink) {
    Rename-Item -Path "$symlink" -NewName "$symlink.bak" -Force
}
## Symlink new config
New-Item -ItemType SymbolicLink -Path $symlink -Target $original

# MPV "host.conf"
## Ensure original config file exists
$original = ".\mpv\config\host.conf"
if (-not (Test-Path $original)) {
    New-Item -Path $original -ItemType File -Force | Out-Null
}
## Backup existing file at link path, if present
$hardlink = "$env:APPDATA\mpv\host.conf"
if (Test-Path $hardlink) {
    Rename-Item -Path $hardlink -NewName "$hardlink.bak" -Force
}
## Create a hardlink for config file
cmd /c mklink /H $hardlink $original

# Helix config
## Backup previous config
$original = "..\..\shared\home-manager\helix\config"
if (-not (Test-Path $original)) {
    New-Item -Path $original -ItemType Directory -Force | Out-Null
}
$symlink = "$env:APPDATA\helix"
if (Test-Path $symlink) {
    Rename-Item -Path "$symlink" -NewName "$symlink.bak" -Force
}
## Symlink new config
New-Item -ItemType SymbolicLink -Path $symlink -Target $original

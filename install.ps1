# install chocolatey(?)
# - check if running admin perms??
#
# wezterm DONE
# fastfetch DONE
# starship
# yazi DONE
# eza
# zoxide
# fzf
# bat
# pwsh profile
# scripts???
#
# glazewm and zebar
# - open on startup
#
# hide taskbar?
#
# tbd...


. "./install_helper/copy_files.ps1"
. "./install_helper/choco_verifier.ps1"

# install chocolatey
# Install-Chocolatey

# TODO: Add powershell profile first before everything else
# Write-Host "Copying powershell profile" -ForegroundColor Cyan
# copy_to_config -file "./powershell/Microsoft.Powershell_profile.ps1" -destination "$PROFILE"

# prompt and install wezterm
do {
    Write-Host "Do you want to install wezterm (terminal emulator) (Y/n): " -Foreground Cyan -NoNewLine
    $wezterm_install = Read-Host
    $wezterm_install = $wezterm_install.ToLower()
} while ($wezterm_install -ne 'y' -and $wezterm_install -ne 'n' -and $wezterm_install -ne 'yes' -and $wezterm_install -ne 'no' -and $wezterm_install -ne '')

if (-not ($wezterm_install -eq 'n' -or $wezterm_install -eq 'no')) {
    Write-Host "Installing wezterm..." -ForegroundColor Cyan
    winget install -e `
    wez.wezterm `
    --silent --accept-package-agreements --accept-source-agreements --ignore-warnings
}

# install fastfetch
Write-Host "Installing fastfetch" -ForegroundColor Cyan
winget install -e `
Fastfetch-cli.Fastfetch `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

# install yazi
Write-Host "Installing yazi" -ForegroundColor Cyan
winget install -e `
sxyazi.yazi `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

# prompt and install optional yazi dependencies
do {
    Write-Host "Do you want to install optional yazi dependencies? (preview text/images/pdfs) (Y/n)" -Foreground Cyan -NoNewLine
    $yazi_optional_dep_install = Read-Host
    $yazi_optional_dep_install = $yazi_optional_dep_install.ToLower()
} while ($yazi_optional_dep_install -ne 'y' -and $yazi_optional_dep_install -ne 'n' -and $yazi_optional_dep_install -ne 'yes' -and $yazi_optional_dep_install -ne 'no' -and $yazi_optional_dep_install -ne '')

if (-not ($yazi_optional_dep_install -eq 'n' -or $yazi_optional_dep_install -eq 'no')) {
    Write-Host "Installing ffmpeg, 7zip, jq, fd, ripgrep, fzf, zoxide, ImageMagick, poppler..." -ForegroundColor Cyan
    winget install -e `
    Gyan.FFmpeg 7zip.7zip jqlang.jq sharkdp.fd BurntSushi.ripgrep.MSVC junegunn.fzf ajeetdsouza.zoxide ImageMagick.ImageMagick oschwartz10612.Poppler `
    --silent --accept-package-agreements --accept-source-agreements --ignore-warnings
}


# copy_to_config -file "./configs/wezterm/wezterm.lua" -destination "$HOME/test/test1"

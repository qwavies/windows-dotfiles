# TODO:
# - prompt and install neovim + neovim config from seperate repo
# - prompt and install window manager (glazewm w/ zebar)
# - > get glazewm to start on startup
# - powertoys
# - translucent TB
# - > hide taskbar

# still debating:
# - discord, java, nodejs, obs, spotify, vscode, intellij, rustup, cargo, gcc, obsidian, tldr
# - prompt for different package manager (choco, scoop)
# WARN: previous bad experiences with both choco and scoop
# example: i havent gotten choco's yazi to work
#
#


. "./install_helper/copy_files.ps1"
. "./install_helper/choco_verifier.ps1"

# NOTE: uncomment to install chocolatey (NEED TO RUN AS ADMINISTRATOR)
# Install-Chocolatey

# Add powershell profile first before everything else
Write-Host "Copying powershell profile" -ForegroundColor Cyan
copy_to_config -file "./powershell/Microsoft.Powershell_profile.ps1" -destination "~/Documents/WindowsPowerShell"

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

    copy_to_config -file "./configs/wezterm/wezterm.lua" -destination "$HOME/.config/wezterm"
}

# primpt and install zen
do {
    Write-Host "Do you want to install zen? (web browser) (Y/n): " -Foreground Cyan -NoNewLine
    $wezterm_install = Read-Host
    $wezterm_install = $wezterm_install.ToLower()
} while ($wezterm_install -ne 'y' -and $wezterm_install -ne 'n' -and $wezterm_install -ne 'yes' -and $wezterm_install -ne 'no' -and $wezterm_install -ne '')

if (-not ($wezterm_install -eq 'n' -or $wezterm_install -eq 'no')) {
    Write-Host "Installing zen..." -ForegroundColor Cyan
    winget install -e `
    Zen-Team.Zen-Browser `
    --silent --accept-package-agreements --accept-source-agreements --ignore-warnings

    copy_to_config -file "./configs/wezterm/wezterm.lua" -destination "$HOME/.config/wezterm"
}

# install fastfetch
Write-Host "Installing fastfetch" -ForegroundColor Cyan
winget install -e `
Fastfetch-cli.Fastfetch `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

copy_to_config -file "./configs/fastfetch/config.jsonc" -destination "$HOME/.config/fastfetch"

# install starship
Write-Host "Installing starship (custom terminal prompt)" -foregroundcolor cyan
winget install -e `
Starship.Starship `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

copy_to_config -file "./configs/starship/starship.toml" -destination "$HOME/.config/starship"

# install fzf
Write-Host "Installing fzf" -foregroundcolor cyan
winget install -e `
junegunn.fzf `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

# install zoxide
Write-Host "Installing zoxide (better cd)" -foregroundcolor cyan
winget install -e `
ajeetdsouza.zoxide `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

# install eza
Write-Host "Installing eza (better ls)" -foregroundcolor cyan
winget install -e `
eza-community.eza `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

# install bat
Write-Host "Installing bat (cat with syntax highlighting)" -foregroundcolor cyan
winget install -e `
sharkdp.bat `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

# install ntop
Write-Host "Installing ntop (top/htop replacement)" -foregroundcolor cyan
winget install -e `
gsass1.NTop `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

# install yazi
Write-Host "Installing yazi (terminal file manager)" -ForegroundColor Cyan
winget install -e `
sxyazi.yazi `
--silent --accept-package-agreements --accept-source-agreements --ignore-warnings

copy_to_config -file "./configs/yazi/yazi.toml" -destination "$HOME/.config/yazi"

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

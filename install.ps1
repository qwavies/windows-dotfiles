# install chocolatey(?)
# - check if running admin perms??
#
# wezterm
# fastfetch
# starship
# yazi
# eza
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
if (-not (Install-Chocolatey)) {
    Write-Error "Chocolatey failed to install. Try running again as administrator"
}


# copy_to_config -file "./configs/wezterm/wezterm.lua" -destination "$HOME/test/test1"

# install chocolatey(?)
# - check if running admin perms??
#
# wezterm
# fastfetch
# starship
# yazi
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
Install-Chocolatey

# install wezterm
do {
    $wezterm_install = Read-Host "Do you want to install wezterm (terminal emulator) (Y/n)"
    $wezterm_install = $wezterm_install.ToLower()
} while ($wezterm_install -ne 'y' -and $wezterm_install -ne 'n' -and $wezterm_install -ne 'yes' -and $wezterm_install -ne 'no' -and $wezterm_install -ne '')

if (-not ($wezterm_install -eq 'n' -or $wezterm_install -eq 'no')) {
    choco install wezterm -y
}

# install fzf
choco install fzf -y


# copy_to_config -file "./configs/wezterm/wezterm.lua" -destination "$HOME/test/test1"

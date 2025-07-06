# Display fastfetch (neofetch alternative) at startup (moved to wezterm config instead)
# fastfetch

# Initialize starship
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
Invoke-Expression (&starship init powershell)

# Set Aliases for more familiarity in the terminal with linux commands and other shortcuts
New-Alias -Name "touch" -Value "New-Item"
New-Alias -Name "unzip" -Value "Expand-Archive"
New-Alias -Name "wc" -Value "Measure-Object"
New-Alias -Name "grep" -Value "rg"
New-Alias -Name "find" -Value "fd"
New-Alias -Name "vim" -Value "nvim"
New-Alias -Name "top" -Value "ntop"
New-Alias -Name "ex" -Value "explorer"
New-Alias -Name "spotify" -Value "spotify_player.exe"

Remove-Item alias:cat
$env:BAT_CONFIG_DIR = "$HOME\.config\bat\"
# $env:BAT_THEME = "Dracula"
$env:BAT_THEME = "Catppuccin Frappe"
New-Alias -Name "cat" -Value "bat"

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

Remove-Item alias:ls
$env:EZA_CONFIG_DIR = "$HOME\.config\eza\"
function ls {eza -T --level=1 --icons}
function lls {eza -Tla --level=1 --icons --git}
function ll {eza -T --level=2 --icons}
function lll {eza -T --level=3 --icons}
function llll {eza -T --level=4 --icons}

function fzfp {fzf --preview="bat --color=always {}"}
function fzfe {nvim $(fzf --preview="bat --color=always {}")}
function fzfc {code $(fzf --preview="bat --color=always {}")}

# Set yazi config path
$env:YAZI_CONFIG_HOME = "$HOME\.config\yazi"
# Custom command and alias for Yazi to be able to change directories
function ff {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

# command to open firefox from the terminal and add any search terms
function firefox {
    param(
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$SearchTerms
    )

    $firefoxPath = "\Program Files\Mozilla Firefox\firefox.exe"

    if ($SearchTerms.Count -gt 0) {
        $query = $SearchTerms -join " "

        switch -Wildcard ($query.ToLower()) {
            "uni"  { $url = "https://learning.monash.edu/my/" }
            "moodle"  { $url = "https://learning.monash.edu/my/" }
            "ed"  { $url = "https://edstem.org/au/dashboard" }
            "youtube"  { $url = "https://youtube.com" }
            "github"   { $url = "https://github.com" }
            default    { $url = "https://www.google.com/search?q=" + [System.Net.WebUtility]::UrlEncode($query) }
        }

        Start-Process $firefoxPath -ArgumentList $url
    } else {
        Start-Process $firefoxPath
    }
}

function uni {firefox uni}
function moodle {firefox moodle}
function ed {firefox ed}
function github {firefox github}

function wallpaper {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ImagePath
    )

    # Resolve the full path and check existence
    try {
        $FullPath = (Resolve-Path $ImagePath -ErrorAction Stop).Path
    }
    catch {
        Write-Error "File not found: $ImagePath"
        return
    }

    # Supported image extensions
    $validExtensions = @(".bmp", ".jpg", ".jpeg", ".png")
    $extension = [IO.Path]::GetExtension($FullPath).ToLower()

    if (-not $validExtensions.Contains($extension)) {
        Write-Error "File exists but is not a supported image type. Supported types: BMP, JPG, JPEG, PNG."
        return
    }

    # Load Windows API for setting wallpaper
    Add-Type @"
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", SetLastError = true)]
        public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

    $success = [Wallpaper]::SystemParametersInfo(20, 0, $FullPath, 3)

    if ($success) {
        $fileName = Split-Path $FullPath -Leaf
        Write-Host "Wallpaper set successfully to '$fileName'." -ForegroundColor Green
    }
    else {
        Write-Error "Failed to set wallpaper. File type may not be supported."
    }
}

function time {
    param(
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Command
    )
    $start = Get-Date
    & $Command[0] @($Command[1..($Command.Length - 1)] -join ' ')
    $end = Get-Date
    $duration = $end - $start
    Write-Host " "
    Write-Host "--------------------------"
    Write-Host " "
    Write-Host "time taken: $duration"
}

# Quick commands to navigate file tree quicker
function home {
    clear
    Set-Location $HOME
    fastfetch
  }

function :q {
  exit
  }

function appdata {Set-Location $HOME\Appdata\Roaming}
function downloads {Set-Location $HOME\Downloads}
function screenshots {Set-Location $HOME\Pictures\Screenshots}
function gh {Set-Location $HOME}
function gd {Set-Location $HOME\Downloads}
function gc {Set-Location $HOME\.config}

### TODO:
# install lua (again)
# look into jq
# look into rmpc (music player)
# create a dotfiles repo on github
# create script to download all essentials on new windows
# change environment variables around to point to the .config folder
# look into KDE connect - set up across devices
#
# easy units
# FIT2001 - systems dev


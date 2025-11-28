$MaximumHistoryCount = 20000

Import-Module posh-git
Import-Module PSReadLine
Import-Module Get-ChildItemColor
Import-Module Terminal-Icons
Import-Module DockerCompletion
Import-Module z
Import-Module psInlineProgress
Import-Module PS-Menu
Import-Module BurntToast
Import-Module TabExpansionPlusPlus

# Uses tab for autocompletion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# History definitions
$HistoryFilePath = "$HOME\Documents\PowerShell\History.xml"
if (Test-Path $HistoryFilePath) {
    try {
        Import-Clixml $HistoryFilePath | Add-History
    } catch {
        Write-Warning "PowerShell history file is corrupted — resetting it."
        Remove-Item $HistoryFilePath -ErrorAction SilentlyContinue
    }
}
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView

# Aliases
Set-Alias which Get-Command
Set-Alias open Invoke-Item

function ll() { Get-ChildItem | Format-Table }
function la() { Get-ChildItem | Format-Wide }
function lb() { Get-ChildItem | Format-List }
function docker-engine { wsl -d Ubuntu-22.04 docker @args }
function close-wsl { wsl --terminate Ubuntu-22.04 } 

Set-Alias ls la
Set-Alias l lb

# Aliases Functions
function cdd() { Set-Location "E:\Downloads" }

function opd() { open "E:\Downloads" }

function edp() { code $PROFILE }
function edh() { code "$HOME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" }

# Compute file hashes - useful for checking successful downloads
function md5    { Get-FileHash -Algorithm MD5 $args }
function sha1   { Get-FileHash -Algorithm SHA1 $args }
function sha256 { Get-FileHash -Algorithm SHA256 $args }

function tail { Get-Content $args -Tail 30 -Wait }

function take {
  New-Item -ItemType directory $args
  Set-Location "$args"
}

# --- Earthy/Forest Theme Colors ---
Set-PSReadLineOption -Color @{
    "Command"         = "#8FBC8F"  # Dark Sea Green (Matches Clock/Status)
    "Parameter"       = "#D2B48C"  # Tan (Matches Git Branch)
    "Operator"        = "#A0522D"  # Sienna (Matches Dividers)
    "Variable"        = "#98FB98"  # Pale Green (Matches Folder)
    "String"          = "#E5C07B"  # Soft Gold (Matches Exec Time)
    "Number"          = "#FFA07A"  # Light Salmon (Soft fruit tone)
    "Member"          = "#F0E68C"  # Khaki
    "Type"            = "#BC8F8F"  # Rosy Brown
    "Comment"         = "#627254"  # Deep Moss Green (Subtle)
    "Keyword"         = "#CD5C5C"  # Indian Red (Autumn Leaf - Matches Attention/Error)
    "Default"         = "#F5FFFA"  # Mint Cream (Soft White)
    "Error"           = "#FF4500"  # Orange Red (High Visibility Warning)
}

$env:VIRTUAL_ENV_DISABLE_PROMPT = 1
$env:PYENV_VIRTUALENV_DISABLE_PROMPT = 1

oh-my-posh init pwsh --config "$HOME/.config/oh-my-posh/deniz-forest-theme.omp.json" | Invoke-Expression
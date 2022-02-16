# Dismiss the welcome message
# clear

function prompt { 
    return @(
        "`e[1;38;5;8m[$((Get-Date).ToString('T'))]`e[0m"
        "`e[0;38;5;3m$([Environment]::UserName.ToLower())`e[0m"
        "@"
        "`e[1;38;5;4m$([Environment]::MachineName.ToLower())`e[0m"
        "`e[1;38;5;5m$($PWD.Path)`e[0m"
        "`e[1;38;5;1m=>`e[0m "
    ) -join ' ' 
}

Set-Alias -Name vi -Value nvim

Set-PSReadLineOption -EditMode Vi

Set-PSReadLineKeyHandler -Chord 'Ctrl+a' -Function BeginningOfLine -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+a' -Function SelectBackwardsLine -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Ctrl+e' -Function EndOfLine -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+e' -Function SelectLine -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Ctrl+f' -Function ForwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+b' -Function BackwardChar -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+f' -Function SelectForwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+b' -Function SelectBackwardChar -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Alt+f' -Function ShellForwardWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Alt+b' -Function ShellBackwardWord -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Ctrl+i' -Function AcceptNextSuggestionWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+i' -Function AcceptNextSuggestionWord -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+y' -Function Yank -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Alt+.' -Function YankLastArg -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Ctrl+h' -Function DeleteChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+h' -Function DeleteChar -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteCharOrExit -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function UnixWordRubout -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Ctrl+k' -Function KillLine -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+u' -Function BackwardKillLine -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Ctrl+c' -Function CopyOrCancelLine -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+c' -Function CopyOrCancelLine -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+x' -Function Cut -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+x' -Function Cut -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+[' -Function ViCommandMode -ViMode Insert

Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+z' -Function Redo -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+z' -Function Redo -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+z' -Function Undo -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+z' -Function Undo -ViMode Command

Set-PSReadLineKeyHandler -Chord 'LeftArrow' -Function BackwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'LeftArrow' -Function BackwardChar -ViMode Command

Set-PSReadLineKeyHandler -Chord 'RightArrow' -Function ForwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'RightArrow' -Function ForwardChar -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+LeftArrow' -Function BackwardWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+LeftArrow' -Function BackwardWord -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+RightArrow' -Function NextWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+RightArrow' -Function NextWord -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Shift+LeftArrow' -Function SelectBackwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Shift+LeftArrow' -Function SelectBackwardChar -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Shift+RightArrow' -Function SelectForwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Shift+RightArrow' -Function SelectForwardChar -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+LeftArrow' -Function SelectBackwardWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+LeftArrow' -Function SelectBackwardWord -ViMode Command

Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+RightArrow' -Function SelectNextWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord 'Ctrl+Shift+RightArrow' -Function SelectNextWord -ViMode Command

# Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -Function ReverseSearchHistory -ViMode Insert
# Set-PSReadLineKeyHandler -Chord 'Ctrl+p' -Function PreviousHistory -ViMode Insert
# Set-PSReadLineKeyHandler -Chord 'Ctrl+n' -Function NextHistory -ViMode Insert

# Incompatible with command history suggestion list-view plugin
# Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

Set-PSReadLineKeyHandler -Chord "Ctrl+p" -Function HistorySearchBackward -ViMode Insert
Set-PSReadLineKeyHandler -Chord "Ctrl+n" -Function HistorySearchForward -ViMode Insert

# https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.2#example-6--use-vimodechangehandler-to-display-vi-mode-changes
# Alter the appearance of the cursor whenever the current Vi mode
# switches to/from Command/Insert mode.
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewline "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewline "`e[5 q"
    }
}
Set-PSReadLineOption `
    -ViModeChangeHandler $Function:OnViModeChange `
    -ViModeIndicator Script `

Set-PSReadLineOption `
    -HistorySearchCaseSensitive:$False `
    -HistorySearchCursorMovesToEnd:$True `
    -HistoryNoDuplicates:$True `
    -MaximumHistoryCount 32767 `
    -ShowToolTips:$True `

# https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.2#example-4--set-multiple-color-options
Set-PSReadLineOption -Colors @{
    ContinuationPrompt = "`e[0;38;5;15m"
    Emphasis           = "`e[1;38;5;15m"
    Error              = "`e[3;38;5;1m"
    Selection          = "`e[0;38;5;15;48;5;8m"
    Default            = "`e[0;38;5;15m"
    Comment            = "`e[0;38;5;8m"
    Keyword            = "`e[0;38;5;5m"
    String             = "`e[0;38;5;6m"
    Operator           = "`e[1;38;5;15m"
    Variable           = "`e[0;38;5;3m"
    Command            = "`e[1;38;5;2m"
    Parameter          = "`e[0;38;5;5m"
    Type               = "`e[0;38;5;4m"
    Number             = "`e[0;38;5;15m"
    Member             = "`e[0;38;5;1m"
    InlinePrediction   = "`e[0;38;5;7m"
}

# Ensure that the PSGallery repository is trusted.
# if (!((Get-PSRepository -Name PSGallery).InstallationPolicy.Equals('Trusted'))) {
#     Set-PSRepository -Name PSGallery -InstallationPolicy Trusted 
# }

# Ensure that the current PSReadLine is version 2.2.0 or higher
# if ($PSVersionTable.PSVersion.Major -ge 7 -and $PSVersionTable.PSVersion.Minor -lt 2) {
#      Update-Module -Name PSReadLine -AllowPrerelease -Force -Confirm
#  }

# Disabled until a suggestion system is implemented, hopefully GitHub Copilot
# Ensure that the PowerShell subsystem plugin model is enabled
# if (!$(Get-ExperimentalFeature -Name PSSubsystemPluginModel).Enabled) { 
#     Enable-ExperimentalFeature PSSubsystemPluginModel
# }

# try {
    # This section will not work until the release of PSReadLine version 2.2.0
    # Remove-Module -Name Az.Tools.Predictor -AllowPrerelease
    # Uninstall-Module -Name Az.Tools.Predictor -AllVersions
    # Get-EventSubscriber -Force -SourceIdentifier PowerShell.OnIdle
# } catch [System.Management.Automation.CommandNotFoundException] {
    # https://techcommunity.microsoft.com/t5/azure-tools-blog/announcing-az-predictor/ba-p/1873104
    # Install-Module -Name Az.Accounts -AllowPrerelease -Confirm        
    # Install-Module -Name Az.Tools.Predictor -AllowPrerelease -Confirm
    #    if (!(Get-PSSubsystem -Kind CommandPredictor).IsRegistered) {
    #        Write-Warning "Module 'Az.Tools.Predictor' is not installed."
    # }
# }

Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History

# https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/
# This statement will not work until the release of PSReadLine version 2.2.0
Set-PSReadLineOption -Colors @{
    ListPrediction = "`e[38;5;7m"
    ListPredictionSelected = "`e[38;5;7;48;5;8m"
}

try {
    # Import-Module -Name PSFzf
    # Enable-PsFzfAliases

    Set-PSReadLineKeyHandler -Chord 'Ctrl+s' -ScriptBlock { Invoke-FuzzySetLocation } -ViMode Insert
    Set-PSReadLineKeyHandler -Chord 'Ctrl+s' -ScriptBlock { Invoke-FuzzySetLocation } -ViMode Command

    Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -ScriptBlock { Invoke-FuzzyHistory } -ViMode Insert
    Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -ScriptBlock { Invoke-FuzzyHistory } -ViMode Command

    Set-PSReadLineKeyHandler -Chord 'Ctrl+q' -ScriptBlock { Invoke-FuzzyKillProcess } -ViMode Insert
    Set-PSReadLineKeyHandler -Chord 'Ctrl+q' -ScriptBlock { Invoke-FuzzyKillProcess } -ViMode Command

    Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion } -ViMode Insert
    Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion } -ViMode Command
    Set-PsFzfOption -TabExpansion

    Set-PSReadLineKeyHandler -Chord 'Ctrl+]' -Function ViCommandMode -ViMode Insert

    # ${Env:FZF_DEFAULT_COMMAND} = "bat --style=numbers --color=always --line-range :500 {}"

    # replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+s' -PSReadlineChordReverseHistory 'Ctrl+r'

} catch [System.Management.Automation.CommandNotFoundException] {
    Install-Module -Name PSFzf -Confirm
}

# try { 
#     Import-Module -Name DockerCompletion 
# } catch {
#     Install-Module -Name DockerCompletion -Confirm
# }

# Load completion scripts saved in a dedicated completions subdirectory.
# Get-ChildItem $(Join-Path $PSScriptRoot 'completion') | ForEach-Object { . $_ }
Get-ChildItem $([System.IO.Path]::Join($PSScriptRoot, 'completion')) | ForEach-Object { . $_ }

# Clear the screen as well as the scrollback buffer
Set-PSReadLineKeyHandler -Chord Ctrl+l -ScriptBlock {
    Clear-Host
    Write-Output "`e[2J`e[3J"
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearScreen()
}

# Set the history to store the maximum possible number of items
Set-Variable -Name MaximumHistoryCount -Value 32767

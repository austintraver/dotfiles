# Dismiss the welcome message
# clear

function prompt {
    if (Test-Path variable:/PSDebugContext) {
        Return '[DBG]: '
    }
    if ($NestedPromptLevel -ge 1)
    {
        Return '>> '
    }
    # + [Environment]::UserName.ToLower() `
    # + ' @ '  `
    # + [Environment]::MachineName.ToLower() `
    $string = $( '' `
        + "`e[31m" `
        + "[$((Get-Date).ToString('T'))]" `
        + ' ' `
        + "`e[32m" `
        + $(Get-Location).ToString().Replace($HOME, "~") `
        + "`e[33m" `
        + ' ' `
        + '||>' `
        + ' ' `
        + "`e[0m"
        # + ' ' `
        # + "($($(Get-History -Count 1).Id))" `
    )
    Return $string
}

Set-Alias -Name vi -Value nvim

Set-PSReadLineOption -EditMode vi

# Currently a beta feature, but it works! Install by running this command:
# > `Install-Module -AllowPrerelease PSReadLine -RequiredVersion 2.2.0-beta1`
# There's also one for Azure specifically
# > `Find-Module Az.Tools.Predictor -AllowPrerelease`
# https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/

# Surround the command line with assistive predictions,
# unless this instance of PowerShell is a non-interactive command
if (!([bool]([Environment]::GetCommandLineArgs() -Contains '-Command'))) {
    Set-PSReadLineOption -PredictionSource History
    # ---
    # The statement below will not work until the release of PSReadLine version 2.2.0
    # https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.2
    # Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    # Set-PSReadLineOption -PredictionViewStyle ListView
}

Set-PSReadLineOption -Colors @{
    Command                  = 'White'
    Number                   = 'Red'
    Member                   = 'Yellow'
    Operator                 = 'White'
    Type                     = 'Green'
    Variable                 = 'Red'
    Parameter                = 'Cyan'
    ContinuationPrompt       = 'White'
    Default                  = 'White'
    String                   = 'Blue'
    Keyword                  = 'Magenta'
    InlinePrediction         = 'Gray'
    Comment                  = 'DarkGray'
    # Selection                = 'Green'
    # The statement below will not work until the release of PSReadLine version 2.2.0
    # https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.2
    # ListPrediction           = 'DarkGray'
    # ListPredictionSelection  = 'Red'
}

# Alter the appearance of the cursor whenever the current Vi mode
# switches to/from Command/Insert mode.
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+a -Function SelectBackwardsLine -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+e -Function SelectLine -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+b -Function BackwardChar -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+Shift+f -Function SelectForwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+b -Function SelectBackwardChar -ViMode Insert

Set-PSReadLineKeyHandler -Chord Alt+f -Function ShellForwardWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord Alt+b -Function ShellBackwardWord -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+i -Function AcceptNextSuggestionWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+i -Function AcceptNextSuggestionWord -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+y -Function Yank -ViMode Insert
Set-PSReadLineKeyHandler -Chord Alt+. -Function YankLastArg -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+r -Function ReverseSearchHistory -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+p -Function PreviousHistory -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+n -Function NextHistory -ViMode Insert

# Set-PSReadLineKeyHandler -Chord Ctrl+p -Function HistorySearchBackward -ViMode Insert
# Set-PSReadLineKeyHandler -Chord Ctrl+n -Function HistorySearchForward -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+h -Function DeleteChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+h -Function DeleteChar -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+w -Function UnixWordRubout -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+k -Function KillLine -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardKillLine -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+c -Function CopyOrCancelLine -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+c -Function CopyOrCancelLine -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+x -Function Cut -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+x -Function Cut -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+] -Function ViCommandMode -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+[ -Function ViCommandMode -ViMode Insert

Set-PSReadLineKeyHandler -Chord Ctrl+Shift+z -Function Redo -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+z -Function Redo -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+z -Function Undo -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+z -Function Undo -ViMode Command

Set-PSReadLineKeyHandler -Chord LeftArrow -Function BackwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord LeftArrow -Function BackwardChar -ViMode Command

Set-PSReadLineKeyHandler -Chord RightArrow -Function ForwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord RightArrow -Function ForwardChar -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function NextWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function NextWord -ViMode Command

Set-PSReadLineKeyHandler -Chord Shift+LeftArrow -Function SelectBackwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord Shift+LeftArrow -Function SelectBackwardChar -ViMode Command

Set-PSReadLineKeyHandler -Chord Shift+RightArrow -Function SelectForwardChar -ViMode Insert
Set-PSReadLineKeyHandler -Chord Shift+RightArrow -Function SelectForwardChar -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+Shift+LeftArrow -Function SelectBackwardWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+LeftArrow -Function SelectBackwardWord -ViMode Command

Set-PSReadLineKeyHandler -Chord Ctrl+Shift+RightArrow -Function SelectNextWord -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+RightArrow -Function SelectNextWord -ViMode Command

# Incompatible with command history suggestion list-view plugin
# Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

Get-ChildItem $(Join-Path $env:XDG_CONFIG_HOME "powershell" "completion") | ForEach-Object { . $_ }

# Install-Module -Name DockerCompletion
Import-Module -Name DockerCompletion

# Clear the screen as well as the scrollback buffer
Set-PSReadLineKeyHandler -Chord Ctrl+l -ScriptBlock {
    Clear-Host
    Write-Output "`e[2J`e[3J"
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearScreen()
}

# Set the history to store the maximum possible number of items
Set-Variable -Name MaximumHistoryCount -Value 32767

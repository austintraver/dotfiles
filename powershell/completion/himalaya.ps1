
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'himalaya' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'himalaya'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-')) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'himalaya' {
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Forces a specific config path')
            [CompletionResult]::new('--config', 'config', [CompletionResultType]::ParameterName, 'Forces a specific config path')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Selects a specific account')
            [CompletionResult]::new('--account', 'account', [CompletionResultType]::ParameterName, 'Selects a specific account')
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Defines the output format')
            [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'Defines the output format')
            [CompletionResult]::new('-l', 'l', [CompletionResultType]::ParameterName, 'Defines the logs level')
            [CompletionResult]::new('--log-level', 'log-level', [CompletionResultType]::ParameterName, 'Defines the logs level')
            [CompletionResult]::new('-m', 'm', [CompletionResultType]::ParameterName, 'Specifies the source mailbox')
            [CompletionResult]::new('--mailbox', 'mailbox', [CompletionResultType]::ParameterName, 'Specifies the source mailbox')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Generates the completion script for the given shell')
            [CompletionResult]::new('notify', 'notify', [CompletionResultType]::ParameterValue, 'Notifies when new messages arrive in the given mailbox')
            [CompletionResult]::new('watch', 'watch', [CompletionResultType]::ParameterValue, 'Watches IMAP server changes')
            [CompletionResult]::new('mailboxes', 'mailboxes', [CompletionResultType]::ParameterValue, 'Lists mailboxes')
            [CompletionResult]::new('flag', 'flag', [CompletionResultType]::ParameterValue, 'Handles flags')
            [CompletionResult]::new('template', 'template', [CompletionResultType]::ParameterValue, 'Generates a message template')
            [CompletionResult]::new('attachments', 'attachments', [CompletionResultType]::ParameterValue, 'Downloads all message attachments')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'Lists all messages')
            [CompletionResult]::new('search', 'search', [CompletionResultType]::ParameterValue, 'Lists messages matching the given IMAP query')
            [CompletionResult]::new('write', 'write', [CompletionResultType]::ParameterValue, 'Writes a new message')
            [CompletionResult]::new('send', 'send', [CompletionResultType]::ParameterValue, 'Sends a raw message')
            [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterValue, 'Saves a raw message')
            [CompletionResult]::new('read', 'read', [CompletionResultType]::ParameterValue, 'Reads text bodies of a message')
            [CompletionResult]::new('reply', 'reply', [CompletionResultType]::ParameterValue, 'Answers to a message')
            [CompletionResult]::new('forward', 'forward', [CompletionResultType]::ParameterValue, 'Forwards a message')
            [CompletionResult]::new('copy', 'copy', [CompletionResultType]::ParameterValue, 'Copies a message to the targetted mailbox')
            [CompletionResult]::new('move', 'move', [CompletionResultType]::ParameterValue, 'Moves a message to the targetted mailbox')
            [CompletionResult]::new('delete', 'delete', [CompletionResultType]::ParameterValue, 'Deletes a message')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;completion' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;notify' {
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'Specifies the keepalive duration')
            [CompletionResult]::new('--keepalive', 'keepalive', [CompletionResultType]::ParameterName, 'Specifies the keepalive duration')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;watch' {
            [CompletionResult]::new('-k', 'k', [CompletionResultType]::ParameterName, 'Specifies the keepalive duration')
            [CompletionResult]::new('--keepalive', 'keepalive', [CompletionResultType]::ParameterName, 'Specifies the keepalive duration')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;mailboxes' {
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'Defines a maximum width for the table')
            [CompletionResult]::new('--max-width', 'max-width', [CompletionResultType]::ParameterName, 'Defines a maximum width for the table')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;flag' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds flags to a message')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Replaces all message flags')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Removes flags from a message')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;flag;add' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;flag;set' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;flag;remove' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;flag;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;template' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Generates a new message template')
            [CompletionResult]::new('reply', 'reply', [CompletionResultType]::ParameterValue, 'Generates a reply message template')
            [CompletionResult]::new('forward', 'forward', [CompletionResultType]::ParameterValue, 'Generates a forward message template')
            [CompletionResult]::new('save', 'save', [CompletionResultType]::ParameterValue, 'Saves a message based on the given template')
            [CompletionResult]::new('send', 'send', [CompletionResultType]::ParameterValue, 'Sends a message based on the given template')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Prints this message or the help of the given subcommand(s)')
            break
        }
        'himalaya;template;new' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Overrides the Subject header')
            [CompletionResult]::new('--subject', 'subject', [CompletionResultType]::ParameterName, 'Overrides the Subject header')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Overrides the From header')
            [CompletionResult]::new('--from', 'from', [CompletionResultType]::ParameterName, 'Overrides the From header')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Overrides the To header')
            [CompletionResult]::new('--to', 'to', [CompletionResultType]::ParameterName, 'Overrides the To header')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Overrides the Cc header')
            [CompletionResult]::new('--cc', 'cc', [CompletionResultType]::ParameterName, 'Overrides the Cc header')
            [CompletionResult]::new('-b', 'b', [CompletionResultType]::ParameterName, 'Overrides the Bcc header')
            [CompletionResult]::new('--bcc', 'bcc', [CompletionResultType]::ParameterName, 'Overrides the Bcc header')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Overrides a specific header')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Overrides a specific header')
            [CompletionResult]::new('-B', 'B', [CompletionResultType]::ParameterName, 'Overrides the body')
            [CompletionResult]::new('--body', 'body', [CompletionResultType]::ParameterName, 'Overrides the body')
            [CompletionResult]::new('-S', 'S', [CompletionResultType]::ParameterName, 'Overrides the signature')
            [CompletionResult]::new('--signature', 'signature', [CompletionResultType]::ParameterName, 'Overrides the signature')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;template;reply' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Overrides the Subject header')
            [CompletionResult]::new('--subject', 'subject', [CompletionResultType]::ParameterName, 'Overrides the Subject header')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Overrides the From header')
            [CompletionResult]::new('--from', 'from', [CompletionResultType]::ParameterName, 'Overrides the From header')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Overrides the To header')
            [CompletionResult]::new('--to', 'to', [CompletionResultType]::ParameterName, 'Overrides the To header')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Overrides the Cc header')
            [CompletionResult]::new('--cc', 'cc', [CompletionResultType]::ParameterName, 'Overrides the Cc header')
            [CompletionResult]::new('-b', 'b', [CompletionResultType]::ParameterName, 'Overrides the Bcc header')
            [CompletionResult]::new('--bcc', 'bcc', [CompletionResultType]::ParameterName, 'Overrides the Bcc header')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Overrides a specific header')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Overrides a specific header')
            [CompletionResult]::new('-B', 'B', [CompletionResultType]::ParameterName, 'Overrides the body')
            [CompletionResult]::new('--body', 'body', [CompletionResultType]::ParameterName, 'Overrides the body')
            [CompletionResult]::new('-S', 'S', [CompletionResultType]::ParameterName, 'Overrides the signature')
            [CompletionResult]::new('--signature', 'signature', [CompletionResultType]::ParameterName, 'Overrides the signature')
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Includes all recipients')
            [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Includes all recipients')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;template;forward' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Overrides the Subject header')
            [CompletionResult]::new('--subject', 'subject', [CompletionResultType]::ParameterName, 'Overrides the Subject header')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Overrides the From header')
            [CompletionResult]::new('--from', 'from', [CompletionResultType]::ParameterName, 'Overrides the From header')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Overrides the To header')
            [CompletionResult]::new('--to', 'to', [CompletionResultType]::ParameterName, 'Overrides the To header')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'Overrides the Cc header')
            [CompletionResult]::new('--cc', 'cc', [CompletionResultType]::ParameterName, 'Overrides the Cc header')
            [CompletionResult]::new('-b', 'b', [CompletionResultType]::ParameterName, 'Overrides the Bcc header')
            [CompletionResult]::new('--bcc', 'bcc', [CompletionResultType]::ParameterName, 'Overrides the Bcc header')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Overrides a specific header')
            [CompletionResult]::new('--header', 'header', [CompletionResultType]::ParameterName, 'Overrides a specific header')
            [CompletionResult]::new('-B', 'B', [CompletionResultType]::ParameterName, 'Overrides the body')
            [CompletionResult]::new('--body', 'body', [CompletionResultType]::ParameterName, 'Overrides the body')
            [CompletionResult]::new('-S', 'S', [CompletionResultType]::ParameterName, 'Overrides the signature')
            [CompletionResult]::new('--signature', 'signature', [CompletionResultType]::ParameterName, 'Overrides the signature')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;template;save' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('--attachment', 'attachment', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;template;send' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('--attachment', 'attachment', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;template;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;attachments' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;list' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Page size')
            [CompletionResult]::new('--size', 'size', [CompletionResultType]::ParameterName, 'Page size')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Page number')
            [CompletionResult]::new('--page', 'page', [CompletionResultType]::ParameterName, 'Page number')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'Defines a maximum width for the table')
            [CompletionResult]::new('--max-width', 'max-width', [CompletionResultType]::ParameterName, 'Defines a maximum width for the table')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;search' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Page size')
            [CompletionResult]::new('--size', 'size', [CompletionResultType]::ParameterName, 'Page size')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Page number')
            [CompletionResult]::new('--page', 'page', [CompletionResultType]::ParameterName, 'Page number')
            [CompletionResult]::new('-w', 'w', [CompletionResultType]::ParameterName, 'Defines a maximum width for the table')
            [CompletionResult]::new('--max-width', 'max-width', [CompletionResultType]::ParameterName, 'Defines a maximum width for the table')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;write' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('--attachment', 'attachment', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;send' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;save' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;read' {
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'MIME type to use')
            [CompletionResult]::new('--mime-type', 'mime-type', [CompletionResultType]::ParameterName, 'MIME type to use')
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reads raw message')
            [CompletionResult]::new('--raw', 'raw', [CompletionResultType]::ParameterName, 'Reads raw message')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;reply' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('--attachment', 'attachment', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('-A', 'A', [CompletionResultType]::ParameterName, 'Includes all recipients')
            [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Includes all recipients')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;forward' {
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('--attachment', 'attachment', [CompletionResultType]::ParameterName, 'Adds attachment to the message')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;copy' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;move' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;delete' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
        'himalaya;help' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Prints help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Prints version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Prints version information')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}

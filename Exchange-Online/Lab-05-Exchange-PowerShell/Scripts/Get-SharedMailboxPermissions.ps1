$Results = foreach ($Mailbox in Get-EXOMailbox -RecipientTypeDetails SharedMailbox) {

    Get-EXOMailboxPermission -Identity $Mailbox.PrimarySmtpAddress |
    Where-Object {$_.User -notlike "NT AUTHORITY*"} |
    Select-Object @{
        Name="Mailbox"
        Expression={$Mailbox.DisplayName}
    },
    User,
    AccessRights
}

$Results |
Export-Csv "..\Reports\SharedMailboxPermissions.csv" -NoTypeInformation

Write-Host "Shared mailbox permission report created."
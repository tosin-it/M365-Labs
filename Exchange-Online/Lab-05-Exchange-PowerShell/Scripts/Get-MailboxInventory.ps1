$Mailboxes = Get-EXOMailbox -ResultSize Unlimited

$Mailboxes |
Select-Object `
DisplayName,
PrimarySmtpAddress,
RecipientTypeDetails,
WhenCreated,
HiddenFromAddressListsEnabled |
Export-Csv "..\Reports\MailboxInventory.csv" -NoTypeInformation

Write-Host ""
Write-Host "Mailbox inventory exported successfully."
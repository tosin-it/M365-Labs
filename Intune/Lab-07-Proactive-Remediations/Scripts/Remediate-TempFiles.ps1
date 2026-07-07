Get-ChildItem "$env:TEMP" -Recurse -Force -ErrorAction SilentlyContinue |
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

Write-Output "Temporary files removed successfully."
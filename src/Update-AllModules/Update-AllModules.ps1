Write-Host 'Updating all PowerShell modules...' -ForegroundColor Magenta
Update-Module
Write-Host 'Module update complete' -ForegroundColor Green


Write-Host 'Removing old versions of PowerShell modules...' -ForegroundColor Magenta
$Latest = Get-InstalledModule
foreach ($module in $Latest) {
    Get-InstalledModule $module.Name -AllVersions | Where-Object {$_.Version -ne $module.Version} | Uninstall-Module -Force -Verbose
}
Write-Host 'Removal of old versions complete' -ForegroundColor Green
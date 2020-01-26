# Global Variables
$nuGetDllSourcePath = '\\filesharePath\NuGet\2.8.5.208\Microsoft.PackageManagement.NuGetProvider.dll'
$powerShellProfileSourcePath = "\\filesharePath\PSProfile\Profile.ps1"

# Copy NuGet DLL to the required directory
if (-Not (Test-Path 'C:\Program Files\PackageManagement\ProviderAssemblies\NuGet\2.8.5.208\Microsoft.PackageManagement.NuGetProvider.dll'))
{
    if (-Not (Test-Path 'C:\Program Files\PackageManagement\ProviderAssemblies\NuGet'))
    {
        New-Item -Path 'C:\Program Files\PackageManagement\ProviderAssemblies\NuGet' -ItemType Directory
    }

    if (-Not (Test-Path 'C:\Program Files\PackageManagement\ProviderAssemblies\NuGet\2.8.5.208'))
    {
        New-Item -Path 'C:\Program Files\PackageManagement\ProviderAssemblies\NuGet\2.8.5.208' -ItemType Directory
    }

    Copy-Item -Path "$nuGetDllSourcePath" -Destination 'C:\Program Files\PackageManagement\ProviderAssemblies\NuGet\2.8.5.208' -Force
}

# Copy global profile, which registers the internal PowerShell Repository
if (Test-Path "$PSHOME")
{
    Copy-Item -Path "$powerShellProfileSourcePath" -Destination "$PSHOME" -Force
}

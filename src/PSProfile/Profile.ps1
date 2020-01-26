$InternalRepoName = 'InternalPSRepository'
$InternalRepoPath = '\\fileshareName'

# Suppress warning caused by lack of internet connectivity
$warningPreferenceOriginal = $WarningPreference
$WarningPreference = 'SilentlyContinue'

# Check to see that the fileshare repository is available
$exists = Test-Path "filesystem::$InternalRepoPath"
if (!$exists) { throw "Repository $InternalRepoPath is offline" }

# Check if the repository is already registered, if not register it
if (!(Get-PSRepository $InternalRepoName -erroraction SilentlyContinue)) {

    # Set parameters for Register-PSRepository
    $repo = @{
        Name                      = "$InternalRepoName"
        SourceLocation            = "$InternalRepoPath"
        PublishLocation           = "$InternalRepoPath"
        InstallationPolicy        = 'Trusted'
        PackageManagementProvider = 'NuGet'
    }

    Register-PSRepository @repo
}

# Set warning preference back to original value
$WarningPreference = $warningPreferenceOriginal
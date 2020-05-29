<#
.Synopsis
   The NCSA license has a few project specific spots in the template. This just swaps out that information appropriately.
.DESCRIPTION
   The NCSA license has a few project specific spots in the template. This just swaps out that information appropriately.
.PARAMETER TeamName
    For our purposes this is typically "Cybersecurity <<sub team>>". Ex: Cybersecurity Engineering.
.PARAMETER RepositoryURL
    The public URL for your project's repository.
.PARAMETER Path
    Path to create the license file at. Defaulted to 'LICENSE' in your current working directory.
.EXAMPLE
   PS C:\> .\New-NCSALicense.ps1 -TeamName "CyberSecurity Engineering" -RepositoryURL "https://github.com/techservicesillinois/SecDev-Tools"
#>

param(
    [Parameter(Mandatory=$true)]    
    [string]$TeamName,

    [Parameter(Mandatory=$true)]
    [string]$RepositoryURL,

    [string]$Path = "$($PWD)\LICENSE"
)

(Get-Content -Path "$($PSscriptRoot)\license_template.txt" -Raw) -f $TeamName,$RepositoryURL,([datetime]::Now.Year) | Set-Content -Path $Path -Force
Get-Item -Path $Path
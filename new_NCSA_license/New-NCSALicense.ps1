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

[string]$Template = @"
Copyright (c) {2} University of Illinois.  All rights reserved.


Developed by: {0}
              University of Illinois
              {1}

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal with
the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to
do so, subject to the following conditions:
* Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimers.
* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimers in the documentation
  and/or other materials provided with the distribution.
* Neither the names of {0}, University of Illinois,
  nor the names of its contributors may be used to endorse or promote products
  derived from this Software without specific prior written permission.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE
SOFTWARE.
"@

$Template -f $TeamName,$RepositoryURL,([datetime]::Now.Year) | Set-Content -Path $Path -Force
Get-Item -Path $Path
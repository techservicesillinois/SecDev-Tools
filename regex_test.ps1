<#
    This script will verify a given regex pattern vs test data.

    This will execute the tests via the .Net regex engine so keep in mind it might not be a perfect port to your given language
    as not all parts of the engine are supported universally. Ex: negative lookahead is supported in .Net but not Go.

    The expected testdata.csv relies on two columns 'String' and 'ShouldMatch' which is a 1/0 on if you expect the patern to match the string.
    String,ShouldMatch
    illinois.edu,0
    i11in0is.mydomain.site,1

    While pattern.txt is just a single line txt file containing your pattern.
    Both of these files should be in the same directory as this script. 
#>

[regex]$Pattern = (Get-Content -Path "$($PSScriptRoot)\pattern.txt")
[System.Collections.ArrayList]$TestData = @()
$TestData += Import-Csv -Path "$($PSScriptRoot)\testdata.csv" | Where-Object -FilterScript {$_.String} #Filter out blank lines

Foreach($Test in $TestData){      
    $ShouldMatch = [Boolean][int]$Test.ShouldMatch
    
    if($ShouldMatch){
        [String]$Message = "Matches '$($Test.String)'"
    }
    Else{
        [String]$Message = "Ignores '$($Test.String)'"
    }

    if($Pattern.Match($Test.String).Success -eq $ShouldMatch){
        $ForegroundColor = 'Green'
    }
    else{
        $ForegroundColor = 'Red'
    }

    Write-Host -Object $Message -ForegroundColor $ForegroundColor
}

function Verb-Noun {

    <#
    .SYNOPSIS
    Short description
    .DESCRIPTION
    Long description
    .EXAMPLE
    Verb-Noun
    Example of how to use this cmdlet
    .EXAMPLE
    Verb-Nound -Param1 test
    Another example of how to use this cmdlet
    .INPUTS
    Inputs to this cmdlet (if any)
    .OUTPUTS
    Output from this cmdlet (if any)
    .NOTES
    General notes
    #>

   [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
        SupportsShouldProcess=$true, 
        PositionalBinding=$false,
        HelpUri = 'http://www.microsoft.com/',
        ConfirmImpact='Medium')]
    [OutputType([String])]
    Param(
        # Param1 help description
        [Parameter(Mandatory=$true, 
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true, 
            ValueFromRemainingArguments=$false, 
            Position=0,
            ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(0,5)]
        [ValidateSet('sun', 'moon', 'earth')]
        $Param1,

        # Param2 help description
        [Parameter(ParameterSetName='Parameter Set 1')]
        [AllowNull()]
        [AllowEmptyCollection()]
        [AllowEmptyString()]
        [ValidateScript({$true})]
        [ValidateRange(0,5)]
        [int]$Param2,

        # Param3 help description
        [Parameter(ParameterSetName='Another Parameter Set')]
        [ValidatePattern('LON-\w{2,3}\d{1,2}')]
        [ValidateLength(0,15)]
        [String]$Param3,

        [Parameter(Mandatory=$true, 
            HelpMessage='On or off')]   # interactive helpmessage: use !? if this is a required parameter
        [string]$Param4,

        [switch]$Param5
    )

    Begin {
        Write-Verbose 'something'
    }
 
    Process {

        foreach($Computer in $ComputerName) {

            if ($pscmdlet.ShouldProcess("Target", "Operation")) {
                # do something

                $properties = [ordered]@{
                'Version' = 2;
                'Model'   = 'X'
                }

                $output = New-Object -TypeName PSObject -Property $properties
                Write-Output $output
            }
        }
    }
 
    End {
        Write-Verbose 'something'
    }
}

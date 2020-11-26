# This is the starting point - the script does not work.

# Press F5 to run it and see

function Get-ServiceProcess {
[CmdletBinding()]param([Parameter(Mandatory=$True)][string[]]$computername)
process{
    foreach($c in $computername){
                $svcs=gwmi win32_service -Comp $c
                foreach($s in $svc) {
            $p = gwmi win32_process -co $c -Fi "id=$($s.processid)"
        $props = @{'computername'=$c;'servicename'=$s.name;'procname'=$p.name}
        new-object psobject -pro $props
}}}

Get-ServiceProcess -computername localhost

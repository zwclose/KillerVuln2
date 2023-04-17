#
# The script demonstrates services control.
# It enables and starts remote registry service as well as rdp service,
# and stops and disables volume shadow copy service. 
#

$clsid = New-Object Guid '7972960B-C3EE-4794-B28B-75F9D36760E6'
$type = [Type]::GetTypeFromCLSID($clsid)
$object = [Activator]::CreateInstance($type)

$object.Initialize(5, 0, 0, "", "")
$factory = $object.GetFactoryManager()
$boostman = $factory.GetGroupBoostManager()

#array of service names
$services = [string[]]@("RemoteRegistry", "TermService", "vss") 
#array of start types
#SERVICE_AUTO_START (2) for remote registry and rdp
#SERVICE_DISABLED (4) for vss
$starts = [int[]]@(2, 2, 4)
#array of states, 2 is "running", 1 is "stopped"
$states = [int[]]@(2, 2, 1)
#array of waits
$waits = [bool[]]@($false, $false, $false)
$boostman.SetBoostedGroupCategoryActionList("UserDefined", $services, $starts, $states, $waits)
#enable boost mode
$boostman.GroupBoostEnabledState = 1
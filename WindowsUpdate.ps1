#
# The script demonstrates blocking network access for a process.
# Blockng svchost.exe processes disrupts Windows update.
#

$clsid = New-Object Guid '7972960B-C3EE-4794-B28B-75F9D36760E6'
$type = [Type]::GetTypeFromCLSID($clsid)
$object = [Activator]::CreateInstance($type)

$object.Initialize(5, 0, 0, "", "")
$factory = $object.GetFactoryManager()
$rman = $factory.GetRulesManager()
$rman.SetProcessRule("svchost.exe",      #bstrProcessName
                     ".*\\svchost\.exe", #bstrProcessRule
                     "UserDefined",      #bstrCategory
                     $true,              #bHidden
                     $false,             #bPinned
                     3,                  #lPriority
                     0,                  #lBandwidthUp
                     0)                  #lBandwidthDown
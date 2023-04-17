#
# The script demonstrates blocking network access to a domain.
#


$clsid = New-Object Guid '7972960B-C3EE-4794-B28B-75F9D36760E6'
$type = [Type]::GetTypeFromCLSID($clsid)
$object = [Activator]::CreateInstance($type)

$object.Initialize(5, 0, 0, "", "")
$factory = $object.GetFactoryManager()
$rman = $factory.GetRulesManager()
$rman.SetDomainRule("intel.com",    #bstrDomainName
                    ".*intel\.com", #bstrDomainRule
                    "UserDefined",  #bstrCategory
                    $true,          #bHidden
                    $false,         #bPinned
                    3,              #lPriority
                    0,              #lBandwidthUp
                    0)              #lBandwidthDown
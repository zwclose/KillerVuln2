#
# The script tries to check if the Killer's COM server is vulnerable.
# The script is just a hand-made utility and does not imply any warranty.
#

try
{
  $clsid = New-Object Guid '7972960B-C3EE-4794-B28B-75F9D36760E6'
  $type = [Type]::GetTypeFromCLSID($clsid)
  $object = [Activator]::CreateInstance($type)

  try
  {
    $object.Initialize(5, 0, 0, "", "")
    Write-Host "Looks vulnerable"
  }
  catch [System.Runtime.InteropServices.COMException]
  {
    if ($_.Exception.ErrorCode -eq 0x80010110)
    {
      try
      {
        $object.Initialize(6, 0, 0, "", "")
      }
      catch [System.Runtime.InteropServices.COMException]
      {
        if ($_.Exception.ErrorCode -eq 0x8001011B)
        {
          Write-Host "Looks patched"
        }
        else
        {
          Write-Host "Unexpected exception"
        }
      }
    }
  }
}
catch [System.Runtime.InteropServices.COMException]
{
  if ($_.Exception.ErrorCode -eq 0x80070424)
  {
    Write-Host "Killer COM server not registered"
  }
  else
  {
    Write-Host "Unexpected exception"
  }
}
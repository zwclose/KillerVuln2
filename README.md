This repository contains supporting files for the PoC of a vulnerability in the Intel Killer Performance Suite. See the [blogpost](https://zwclose.github.io/) for details of the vuln.

**List of files**:
* WindowsUpdate.ps1: blocks network access for all svchost.exe processes in the OS. As result, Windows update stops working
* Intel.ps1: blocks access to intel.com
* Services.ps1: enables and starts remote registry and rdp services, disables and stops volume shadow copy service
* KillerNetworkService.idl: IDL of Killer's COM server
* KillerCheck.ps1: checks whether Killer's COM server is patched or not

For details of the vulnerability and the demo video refer to the [blogpost](https://zwclose.github.io/). Feel free to ask questions in [Twitter](https://twitter.com/zwclose)
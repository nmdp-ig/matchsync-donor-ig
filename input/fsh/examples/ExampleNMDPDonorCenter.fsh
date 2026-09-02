Instance: ExampleNMDPDonorCenter
InstanceOf: NMDPOrganization
Usage: #example
Title: "Example NMDP Donor Center"
Description: "An example donor center in the NMDP network."
* identifier[nmdpCenterId].system = $nmdp-donor-center
* identifier[nmdpCenterId].value = "12345"
* name = "Minneapolis Blood Center"
* type = NMDPCenterTypeCS#donor-center "Donor Center"
* active = true

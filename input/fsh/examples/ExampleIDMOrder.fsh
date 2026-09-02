Instance: ExampleIDMOrder
InstanceOf: NMDPIDMOrder
Usage: #example
Title: "Example IDM Order"
Description: "An example infectious disease marker testing order for a donor prior to collection."
* identifier[nmdpOrderId].system = $nmdp-order
* identifier[nmdpOrderId].value = "ORD-2026-005678"
* status = #active
* intent = #order
* code = NMDPOrderTypeCS#idm "Infectious Disease Markers"
* subject = Reference(ExampleNMDPDonor)
* authoredOn = "2026-07-20"
* requester = Reference(ExampleNMDPDonorCenter)
* performer = Reference(ExampleNMDPDonorCenter)

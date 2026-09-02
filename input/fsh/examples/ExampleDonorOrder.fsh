Instance: ExampleDonorOrder
InstanceOf: NMDPDonorOrder
Usage: #example
Title: "Example Donor CT Order"
Description: "An example confirmatory typing order for an NMDP donor."
* identifier[nmdpOrderId].system = $nmdp-order
* identifier[nmdpOrderId].value = "ORD-2026-001234"
* status = #active
* intent = #order
* code = NMDPOrderTypeCS#ct "Confirmatory Typing"
* subject = Reference(ExampleNMDPDonor)
* authoredOn = "2026-07-15"
* requester = Reference(ExampleNMDPDonorCenter)
* performer = Reference(ExampleNMDPDonorCenter)

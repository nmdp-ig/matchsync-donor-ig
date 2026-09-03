Instance: ExampleDonorOrder
InstanceOf: NMDPDonorOrder
Usage: #example
Title: "Example Donor CT Order"
Description: "An example confirmatory typing order for an NMDP donor. Subject is the recipient, performer is the donor."
* identifier[matchsourceOrder].system = $nmdp-id-matchsource-order
* identifier[matchsourceOrder].value = "MS-ORD-2026-44321"
* status = #active
* intent = #order
* code = NMDPOrderTypeCS#confirmatory-typing "Confirmatory Typing"
* subject = Reference(ExampleRecipientPatient)
* performer = Reference(ExampleNMDPDonor)
* authoredOn = "2026-07-01T10:00:00Z"
* occurrenceDateTime = "2026-07-20T09:00:00Z"

Instance: ExampleIDMOrder
InstanceOf: NMDPIDMOrder
Usage: #example
Title: "Example IDM Order"
Description: "An example infectious disease marker testing order for a donor prior to collection."
* identifier[matchsourceOrder].system = $nmdp-id-matchsource-order
* identifier[matchsourceOrder].value = "MS-ORD-2026-55678"
* status = #active
* intent = #order
* code = NMDPOrderTypeCS#idm "Infectious Disease Markers"
* subject = Reference(ExampleRecipientPatient)
* performer = Reference(ExampleNMDPDonor)
* authoredOn = "2026-07-20"

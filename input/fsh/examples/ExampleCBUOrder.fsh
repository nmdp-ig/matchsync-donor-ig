Instance: ExampleCBUOrder
InstanceOf: NMDPCBUOrder
Usage: #example
Title: "Example CBU Order"
Description: "An example high resolution typing order for a Cord Blood Unit. Subject is the recipient, performer is the CBU."
* identifier[matchsourceOrder].system = $nmdp-id-matchsource-order
* identifier[matchsourceOrder].value = "MS-ORD-2026-99887"
* status = #active
* intent = #order
* code = NMDPOrderTypeCS#A-HR "HLA-A High Resolution"
* subject = Reference(ExampleRecipientPatient)
* performer = Reference(ExampleCBUPatient)
* authoredOn = "2026-08-01T14:30:00Z"
* occurrenceDateTime = "2026-08-10T10:00:00Z"

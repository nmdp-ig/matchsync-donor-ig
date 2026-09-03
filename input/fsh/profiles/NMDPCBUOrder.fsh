Profile: NMDPCBUOrder
Parent: ServiceRequest
Id: nmdp-cbu-order
Title: "NMDP CBU Order"
Description: "A profile representing a Cord Blood Unit (CBU) workup order in the NMDP system. CBU orders can include high resolution typing for individual loci or a full panel. ServiceRequest.subject references the recipient Patient, and ServiceRequest.performer references the CBU Patient."

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    matchsourceOrder 1..1 MS
* identifier[matchsourceOrder].system 1..1
* identifier[matchsourceOrder].system = $nmdp-id-matchsource-order
* identifier[matchsourceOrder].value 1..1
* identifier[matchsourceOrder] ^short = "MatchSource order number"
* identifier[matchsourceOrder] ^definition = "The order number assigned by the NMDP MatchSource system. System: http://nmdp.org/identifier/matchsource-order"

* status MS
* intent 1..1 MS
* intent = #order

* code 1..1 MS
* code from NMDPOrderTypeVS (extensible)
* code ^short = "Type of CBU order (A-HR, B-HR, C-HR, ABC-DRB1-DQB1-DPB1-HR)"
* code ^definition = "The type of CBU order. Can include individual locus high resolution typing or a full panel. Multiple codes may be present in a single ServiceRequest."

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The recipient Patient this order is for"
* subject ^definition = "The recipient Patient (identified by RID) that this CBU order is associated with."

* performer 0..* MS
* performer only Reference(Patient)
* performer ^short = "The CBU Patient performing this order"
* performer ^definition = "The CBU Patient (identified by cbu-source-id) that will undergo the ordered procedure."

* authoredOn 1..1 MS
* authoredOn ^short = "Order submitted date"

* occurrenceDateTime 0..1 MS
* occurrenceDateTime ^short = "CT sample ship date"

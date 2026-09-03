Profile: NMDPDonorOrder
Parent: ServiceRequest
Id: nmdp-donor-order
Title: "NMDP Donor Order"
Description: "A profile representing a donor workup order in the NMDP system. For donors, the ordered item is always confirmatory typing. ServiceRequest.subject references the recipient Patient, and ServiceRequest.performer references the donor Patient."

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
* code ^short = "Type of order (e.g., confirmatory-typing)"
* code ^definition = "The type of donor order. For donor orders this is always confirmatory typing (code: confirmatory-typing)."

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The recipient Patient this order is for"
* subject ^definition = "The recipient Patient (identified by RID) that this donor order is associated with."

* performer 0..* MS
* performer only Reference(Patient)
* performer ^short = "The donor Patient performing this order"
* performer ^definition = "The donor Patient (identified by GRID) who will undergo the ordered procedure."

* authoredOn 1..1 MS
* authoredOn ^short = "Order submitted date"

* occurrenceDateTime 0..1 MS
* occurrenceDateTime ^short = "Appointment date (CT draw appointment)"

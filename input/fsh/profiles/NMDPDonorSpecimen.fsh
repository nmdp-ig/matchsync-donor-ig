Profile: NMDPDonorSpecimen
Parent: Specimen
Id: nmdp-donor-specimen
Title: "NMDP Donor Specimen"
Description: "A profile representing a testing specimen (blood tube, buccal swab, etc.) collected from a donor for HLA typing or infectious disease marker testing. Specimens are identified by Order Number + Donor GRID rather than individual specimen IDs."

* subject 1..1 MS
* subject only Reference(NMDPDonorPatient)
* subject ^short = "The donor this specimen was collected from"
* subject ^definition = "Reference to the donor (NMDPDonorPatient) from whom this specimen was collected."

* type 1..1 MS
* type from NMDPSpecimenTypeVS (extensible)
* type ^short = "Type of specimen (blood tube type, buccal swab, etc.)"
* type ^definition = "The type of specimen collected, indicating the sample material and any anticoagulant used."

* request 0..* MS
* request only Reference(NMDPDonorOrder)
* request ^short = "The order that requested this specimen"
* request ^definition = "Reference to the ServiceRequest (NMDPDonorOrder) that initiated collection of this specimen."

* collection.collectedDateTime 0..1 MS
* collection.collectedDateTime ^short = "When the specimen was collected"
* collection.collectedDateTime ^definition = "The date and time the specimen was collected from the donor."

* collection.collector 0..1 MS
* collection.collector ^short = "Practitioner who collected the specimen"
* collection.collector ^definition = "The practitioner at the donor center who collected this specimen."

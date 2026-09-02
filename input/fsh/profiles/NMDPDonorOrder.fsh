Profile: NMDPDonorOrder
Parent: ServiceRequest
Id: nmdp-donor-order
Title: "NMDP Donor Order"
Description: "A profile representing a donor workup or collection order in the NMDP system. Orders include confirmatory typing (CT), infectious disease markers (IDM), and stem cell collection."

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    nmdpOrderId 1..1 MS
* identifier[nmdpOrderId].system 1..1
* identifier[nmdpOrderId].system = $nmdp-order
* identifier[nmdpOrderId].value 1..1
* identifier[nmdpOrderId] ^short = "NMDP Order ID"
* identifier[nmdpOrderId] ^definition = "The unique identifier assigned to this order by the NMDP system."

* status MS
* intent 1..1 MS
* intent = #order
* code 0..1 MS
* code from NMDPOrderTypeVS (extensible)
* code ^short = "Type of order (CT, IDM, Collection, PBSC, Marrow)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The donor this order is for"
* subject ^definition = "The donor (NMDPDonorPatient) this order is for. Constrained to Patient references."

* authoredOn 1..1 MS
* authoredOn ^short = "When the order was created"

* requester 0..1 MS
* requester only Reference(NMDPOrganization or Practitioner)
* requester ^short = "Organization or practitioner who requested this order"
* requester ^definition = "The transplant center or practitioner who initiated the donor workup or collection order."

* performer 0..* MS
* performer only Reference(NMDPOrganization)
* performer ^short = "Organization performing the order"
* performer ^definition = "The donor center, collection center, or lab performing this order."

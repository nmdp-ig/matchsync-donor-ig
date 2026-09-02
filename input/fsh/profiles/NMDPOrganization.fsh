Profile: NMDPOrganization
Parent: Organization
Id: nmdp-organization
Title: "NMDP Organization"
Description: "An organization participating in the NMDP network (donor centers, transplant centers, collection centers, apheresis centers)."

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    nmdpCenterId 1..1 MS
* identifier[nmdpCenterId].system 1..1
* identifier[nmdpCenterId].system = $nmdp-donor-center
* identifier[nmdpCenterId].value 1..1
* identifier[nmdpCenterId] ^short = "NMDP Center ID"
* identifier[nmdpCenterId] ^definition = "The unique identifier assigned to a center in the NMDP network."

* name 1..1 MS
* type 0..* MS
* type from NMDPCenterTypeVS (extensible)
* active 1..1 MS

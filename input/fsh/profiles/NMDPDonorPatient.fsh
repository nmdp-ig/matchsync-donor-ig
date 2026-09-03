Profile: NMDPDonorPatient
Parent: USCorePatientProfile
Id: nmdp-donor-patient
Title: "NMDP Donor Patient"
Description: "A profile representing a hematopoietic cell donor registered in the NMDP registry. Donors are identified by having an NMDP GRID identifier. The Patient.id should be the GRID value."

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice on identifier system"
* identifier contains
    grid 1..1 MS and
    sourceId 0..1 MS
* identifier[grid].system 1..1
* identifier[grid].system = $nmdp-id-grid
* identifier[grid].value 1..1
* identifier[grid] ^short = "NMDP GRID (Global Registration Identifier for Donors)"
* identifier[grid] ^definition = "The NMDP GRID identifier that uniquely identifies a donor. A 32-character uppercase alphanumeric string (0-9 and A-F, no dashes or spaces), e.g. 99D0BA02660443B585D525525EB3F2D2. System: http://nmdp.org/identifier/grid"
* identifier[sourceId].system 1..1
* identifier[sourceId].system = $nmdp-id-source-id
* identifier[sourceId].value 1..1
* identifier[sourceId] ^short = "Donor source ID"
* identifier[sourceId] ^definition = "The source identifier for the donor in the originating registry. System: http://nmdp.org/identifier/source-id"

* gender 1..1 MS
* birthDate 1..1 MS

* managingOrganization 0..1 MS
* managingOrganization only Reference(NMDPOrganization)
* managingOrganization ^short = "Donor center (ION/DC ID)"
* managingOrganization ^definition = "The NMDP donor center (identified by ION/DC ID) responsible for this donor."

* extension contains
    DonorStatus named donorStatus 0..1
* extension[donorStatus] ^short = "Donor registry status"
* extension[donorStatus] ^definition = "The current registration status of the donor (e.g., Available, Temporarily Unavailable, Active, Permanently Unavailable)."

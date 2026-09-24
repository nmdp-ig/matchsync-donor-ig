Profile: NMDPDonorPatient
Parent: USCorePatientProfile
Id: nmdp-donor-patient
Title: "NMDP Donor Patient"
Description: "A profile representing a hematopoietic cell donor registered in the NMDP registry. Donors are identified by having an NMDP GRID identifier. The Patient.id should be the GRID value."

// Remove US Core Patient extensions not used by this profile
* extension[tribalAffiliation] 0..0
* extension[birthsex] 0..0
* extension[sex] 0..0
* extension[genderIdentity] 0..0

* identifier 1..1 MS
* identifier ^short = "Donor identifier"
* identifier ^definition = "An identifier for the donor. May be any of the supported NMDP identifiers (e.g. GRID, Donor source ID). The identifier system distinguishes which identifier type is present."

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

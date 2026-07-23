Profile: NMDPDonorPatient
Parent: USCorePatientProfile
Id: nmdp-donor-patient
Title: "NMDP Donor Patient"
Description: "A profile representing a hematopoietic cell donor registered in the NMDP registry."

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice on identifier system"
* identifier contains
    nmdpDonorId 1..1 MS and
    grid 0..1 MS
* identifier[nmdpDonorId].system 1..1
* identifier[nmdpDonorId].system = $nmdp-donor
* identifier[nmdpDonorId].value 1..1
* identifier[nmdpDonorId] ^short = "NMDP Donor ID"
* identifier[nmdpDonorId] ^definition = "The unique identifier assigned to a donor by the National Marrow Donor Program."
* identifier[grid].system 1..1
* identifier[grid].system = $isbt-grid
* identifier[grid].value 1..1
* identifier[grid] ^short = "Global Registration Identifier for Donors (GRID)"
* identifier[grid] ^definition = "The ISBT 128 Global Registration Identifier for Donors."

* name 1..* MS
* name.family MS
* name.given MS
* gender 1..1 MS
* birthDate 1..1 MS
* deceased[x] 0..1 MS
* deceased[x] ^short = "Indicates if the donor is deceased"
* deceased[x] ^definition = "Indicates if the donor is deceased, either as a boolean flag or a dateTime of death."
* communication 0..* MS
* communication.language 1..1 MS

* managingOrganization 0..1 MS
* managingOrganization only Reference(NMDPOrganization)
* managingOrganization ^short = "Donor center managing this donor"
* managingOrganization ^definition = "The NMDP-affiliated organization (typically a donor center) that manages this donor's registration."

* extension contains
    DonorStatus named donorStatus 0..1
* extension[race] ^short = "US Core Race"
* extension[ethnicity] ^short = "US Core Ethnicity"
* extension[donorStatus] ^short = "Donor registry status"

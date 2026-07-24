Extension: DonorStatus
Id: donor-status
Title: "Donor Status"
Description: "The registration status of a donor in the NMDP registry, with an optional available date for temporarily unavailable donors."
Context: Patient
* extension contains
    status 1..1 and
    availableDate 0..1
* extension[status].value[x] only code
* extension[status].valueCode from NMDPDonorStatusVS (required)
* extension[status] ^short = "Donor registration status code"
* extension[status] ^definition = "The current registration status of the donor in the NMDP registry."
* extension[availableDate].value[x] only date
* extension[availableDate] ^short = "Date donor becomes available again"
* extension[availableDate] ^definition = "The date when a temporarily unavailable donor is expected to become available again. Only meaningful when status is temporarily-unavailable."

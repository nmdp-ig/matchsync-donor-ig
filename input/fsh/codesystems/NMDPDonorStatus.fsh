CodeSystem: NMDPDonorStatusCS
Id: nmdp-donor-status
Title: "NMDP Donor Status"
Description: """Status codes for NMDP registered donors. These codes represent the
enterprise Registry Status maintained by NMDP, indicating a donor's availability
for patient search, matching, and product request activities. Source: ODS
DonorWithSampleResponse (v05). In FHIR Donor API payloads, donor status is
conveyed as a valueString on the donor-status extension."""
* ^caseSensitive = false
* ^content = #complete
* ^url = "http://fhir.nmdp.org/CodeSystem/donor-status"
* #Available "Available" "Donor is available for search, further typing, and collection/transplant (ODS code: AV)."
* #Temporarily-Unavailable "Temporarily Unavailable" "Donor is temporarily unavailable, typically post-collection with a future available date (ODS code: TU)."
* #Active "Active" "Donor is currently active on a search — reserved for a specific patient case (ODS code: AC)."
* #Permanently-Unavailable "Permanently Unavailable" "Donor has been permanently removed from the registry. Reasons include: not interested, permanently medically deferred, unable to contact, donor too old, or deceased (ODS code: DE)."

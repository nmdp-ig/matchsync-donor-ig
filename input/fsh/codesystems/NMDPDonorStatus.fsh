CodeSystem: NMDPDonorStatusCS
Id: nmdp-donor-status
Title: "NMDP Donor Status"
Description: """Status codes for NMDP registered donors. These codes represent the
enterprise Registry Status maintained by NMDP, indicating a donor's availability
for patient search, matching, and product request activities. Source: ODS
DonorWithSampleResponse (v05)."""
* ^caseSensitive = true
* ^content = #complete
* ^url = "http://terminology.nmdp.org/codesystem/donor-status"
* #available "Available" "Donor is available for search, further typing, and collection/transplant (ODS code: AV)."
* #temporarily-unavailable "Temporarily Unavailable" "Donor is temporarily unavailable, typically post-collection with a future available date (ODS code: TU)."
* #active "Active" "Donor is currently active on a search — reserved for a specific patient case (ODS code: AC)."
* #permanently-unavailable "Permanently Unavailable" "Donor has been permanently removed from the registry. Reasons include: not interested, permanently medically deferred, unable to contact, donor too old, or deceased (ODS code: DE)."

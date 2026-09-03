Extension: DonorStatus
Id: donor-status
Title: "Donor Status"
Description: "The registration status of a donor in the NMDP registry. Conveyed as a simple string value (e.g., 'Available', 'Temporarily Unavailable', 'Active', 'Permanently Unavailable')."
Context: Patient
* value[x] only string
* valueString 1..1
* valueString ^short = "Donor registration status"
* valueString ^definition = "The current registration status of the donor in the NMDP registry as a human-readable string."

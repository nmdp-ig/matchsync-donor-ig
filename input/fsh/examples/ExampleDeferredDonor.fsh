Instance: ExampleDeferredDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example Deferred Donor"
Description: "A donor who is temporarily unavailable (e.g., post-collection)."
* identifier[grid].system = $nmdp-id-grid
* identifier[grid].value = "3553DKM007655109283"
* identifier[sourceId].system = $nmdp-id-source-id
* identifier[sourceId].value = "SRC-76543"
* name[0].family = "Chen"
* name[0].given[0] = "Lisa"
* gender = #female
* birthDate = "1992-08-22"
* extension[donorStatus].valueString = "Temporarily Unavailable"
* extension[race].extension[ombCategory].valueCoding = $cdc-race-ethnicity#2028-9 "Asian"
* extension[race].extension[text].valueString = "Asian"
* extension[ethnicity].extension[ombCategory].valueCoding = $cdc-race-ethnicity#2135-2 "Hispanic or Latino"
* extension[ethnicity].extension[text].valueString = "Hispanic or Latino"

Instance: ExampleDeferredDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example Deferred Donor"
Description: "A donor who is temporarily unavailable (e.g., post-collection with a future available date)."
* identifier[nmdpDonorId].system = $nmdp-donor
* identifier[nmdpDonorId].value = "7654321"
* name[0].family = "Chen"
* name[0].given[0] = "Lisa"
* gender = #female
* birthDate = "1992-08-22"
* extension[donorStatus].valueCode = #temporarily-unavailable
* extension[race].extension[ombCategory].valueCoding = urn:oid:2.16.840.1.113883.6.238#2028-9 "Asian"
* extension[race].extension[text].valueString = "Asian"
* extension[ethnicity].extension[ombCategory].valueCoding = urn:oid:2.16.840.1.113883.6.238#2135-2 "Hispanic or Latino"
* extension[ethnicity].extension[text].valueString = "Hispanic or Latino"

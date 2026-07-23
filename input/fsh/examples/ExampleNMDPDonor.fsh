Instance: ExampleNMDPDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example NMDP Donor"
Description: "An example donor registered in the NMDP registry."
* identifier[nmdpDonorId].system = $nmdp-donor
* identifier[nmdpDonorId].value = "1234567"
* identifier[grid].system = $isbt-grid
* identifier[grid].value = "AAAA1111111"
* name[0].family = "Reynolds"
* name[0].given[0] = "Marcus"
* name[0].given[1] = "James"
* gender = #male
* birthDate = "1985-03-15"
* extension[donorStatus].valueCode = #active
* extension[race].extension[ombCategory].valueCoding = $cdc-race-ethnicity#2106-3 "White"
* extension[race].extension[text].valueString = "White"
* extension[ethnicity].extension[ombCategory].valueCoding = $cdc-race-ethnicity#2186-5 "Not Hispanic or Latino"
* extension[ethnicity].extension[text].valueString = "Not Hispanic or Latino"

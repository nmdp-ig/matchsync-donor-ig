Instance: ExampleNMDPDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example NMDP Donor"
Description: "An example donor registered in the NMDP registry."
* identifier[grid].system = $nmdp-id-grid
* identifier[grid].value = "99D0BA02660443B585D525525EB3F2D2"
* identifier[sourceId].system = $nmdp-id-source-id
* identifier[sourceId].value = "SRC-77412"
* name[0].family = "Reynolds"
* name[0].given[0] = "Marcus"
* gender = #male
* birthDate = "1985-03-15"
* extension[donorStatus].valueString = "Available"
* extension[race].extension[ombCategory].valueCoding = $cdc-race-ethnicity#2106-3 "White"
* extension[race].extension[text].valueString = "White"
* extension[ethnicity].extension[ombCategory].valueCoding = $cdc-race-ethnicity#2186-5 "Not Hispanic or Latino"
* extension[ethnicity].extension[text].valueString = "Not Hispanic or Latino"
* managingOrganization = Reference(ExampleNMDPDonorCenter)

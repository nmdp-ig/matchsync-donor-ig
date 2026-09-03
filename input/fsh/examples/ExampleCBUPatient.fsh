Instance: ExampleCBUPatient
InstanceOf: NMDPCBUPatient
Usage: #example
Title: "Example CBU Patient"
Description: "An example Cord Blood Unit (CBU) registered in the NMDP registry, demonstrating all CBU identifier slices and demographics."
* identifier[cbuSourceId].system = $nmdp-id-cbu-source-id
* identifier[cbuSourceId].value = "CBU-SRC-20180415-001"
* identifier[cbuRegistryId].system = $nmdp-id-cbu-registry-id
* identifier[cbuRegistryId].value = "REG-CBU-887744"
* identifier[cbbId].system = $nmdp-id-cbb-id
* identifier[cbbId].value = "CBB-5521"
* name[0].family = "CordUnit"
* name[0].given[0] = "Unit20180415"
* gender = #female
* birthDate = "2018-04-15"
* extension[cbuStatus].valueString = "Available"
* extension[race].extension[ombCategory].valueCoding = $cdc-race-ethnicity#2054-5 "Black or African American"
* extension[race].extension[text].valueString = "Black or African American"
* extension[ethnicity].extension[ombCategory].valueCoding = $cdc-race-ethnicity#2186-5 "Not Hispanic or Latino"
* extension[ethnicity].extension[text].valueString = "Not Hispanic or Latino"

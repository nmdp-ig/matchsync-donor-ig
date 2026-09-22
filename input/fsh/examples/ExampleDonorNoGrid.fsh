Instance: ExampleDonorNoGrid
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example Donor With GRID Only"
Description: "A donor with a GRID identifier and no source ID yet assigned."
* identifier[grid].system = $nmdp-id-grid
* identifier[grid].value = "3553DKM002948175630"
* name[0].family = "Okafor"
* name[0].given[0] = "Adaeze"
* gender = #female
* birthDate = "1998-11-02"
* extension[donorStatus].valueString = "Active"

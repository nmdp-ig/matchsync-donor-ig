Instance: ExampleDonorNoGrid
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example Donor Without GRID"
Description: "A newly registered donor who has an NMDP Donor ID but has not yet been assigned a GRID."
* identifier[nmdpDonorId].system = $nmdp-donor
* identifier[nmdpDonorId].value = "9876543"
* name[0].family = "Okafor"
* name[0].given[0] = "Adaeze"
* gender = #female
* birthDate = "1998-11-02"
* extension[donorStatus].valueCode = #active
* communication[0].language = urn:ietf:bcp:47#en "English"

Instance: ExampleDeceasedDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example Deceased Donor"
Description: "A donor who is deceased, demonstrating the donor-status extension with Permanently Unavailable."
* identifier.system = $nmdp-id-grid
* identifier.value = "3553DKM004182337541"
* name[0].family = "Johansson"
* name[0].given[0] = "Erik"
* gender = #male
* birthDate = "1970-04-10"
* extension[donorStatus].valueString = "Permanently Unavailable"

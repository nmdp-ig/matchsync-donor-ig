Instance: ExampleDeceasedDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example Deceased Donor"
Description: "A donor who is deceased, demonstrating the donor-status extension with Permanently Unavailable."
* identifier[grid].system = $nmdp-id-grid
* identifier[grid].value = "3F7A1C9E5B2D8046AF13CE79B0D4E2A1"
* identifier[sourceId].system = $nmdp-id-source-id
* identifier[sourceId].value = "SRC-55123"
* name[0].family = "Johansson"
* name[0].given[0] = "Erik"
* gender = #male
* birthDate = "1970-04-10"
* extension[donorStatus].valueString = "Permanently Unavailable"

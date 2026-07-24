Instance: ExampleDeceasedDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example Deceased Donor"
Description: "A donor who is deceased, demonstrating the deceased[x] element with a dateTime value."
* identifier[nmdpDonorId].system = $nmdp-donor
* identifier[nmdpDonorId].value = "5551234"
* identifier[grid].system = $isbt-grid
* identifier[grid].value = "BBBB2222222"
* name[0].family = "Johansson"
* name[0].given[0] = "Erik"
* gender = #male
* birthDate = "1970-04-10"
* deceasedDateTime = "2025-06-15"
* extension[donorStatus].valueCode = #permanently-unavailable

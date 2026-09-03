Instance: ExampleRecipientPatient
InstanceOf: USCorePatientProfile
Usage: #example
Title: "Example Recipient Patient"
Description: "An example recipient patient identified by RID and local ID. Used as the subject of donor and CBU orders."
* identifier[0].system = $nmdp-id-rid
* identifier[0].value = "RID-9988776"
* identifier[1].system = $nmdp-id-local-id
* identifier[1].value = "TC-LOCAL-44321"
* name[0].family = "Garcia"
* name[0].given[0] = "Maria"
* gender = #female
* birthDate = "1975-06-20"

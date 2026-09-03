Instance: ExampleDonorBodyWeight
InstanceOf: NMDPBodyWeightObservation
Usage: #example
Title: "Example Donor Body Weight Observation"
Description: "An example body weight observation for a donor (82 kg)."
* status = #final
* code = $loinc#29463-7 "Body weight"
* subject = Reference(ExampleNMDPDonor)
* valueQuantity.value = 82
* valueQuantity.unit = "kg"
* valueQuantity.system = $ucum
* valueQuantity.code = #kg

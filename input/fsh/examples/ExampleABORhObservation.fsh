Instance: ExampleDonorABORh
InstanceOf: NMDPABORhObservation
Usage: #example
Title: "Example Donor ABO/Rh Observation"
Description: "An example ABO/Rh blood group observation for a donor (O Positive)."
* status = #final
* code = $loinc#882-1 "ABO and Rh group [Type] in Blood"
* subject = Reference(ExampleNMDPDonor)
* valueCodeableConcept = $loinc#LA21321-7 "O Pos"

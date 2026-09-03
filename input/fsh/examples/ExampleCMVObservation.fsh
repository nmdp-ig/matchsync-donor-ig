Instance: ExampleDonorCMV
InstanceOf: NMDPCMVObservation
Usage: #example
Title: "Example Donor CMV Observation"
Description: "An example CMV IgG antibody observation for a donor (Negative)."
* status = #final
* code = $loinc#22244-8 "CMV IgG Ab [Presence] in Serum"
* subject = Reference(ExampleNMDPDonor)
* valueCodeableConcept.text = "Negative"

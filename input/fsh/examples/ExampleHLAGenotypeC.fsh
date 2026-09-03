Instance: ExampleHLAGenotypeC
InstanceOf: NMDPHLAGenotype
Usage: #example
Title: "Example HLA-C Genotype"
Description: "An example HLA-C genotype observation showing a donor typed as HLA-C*07:01+HLA-C*05:01."
* status = #final
* code = $loinc#57297-4 "HLA-Cw [Type] by High resolution"
* subject = Reference(ExampleNMDPDonor)
* valueCodeableConcept.coding[0].system = "http://glstring.org"
* valueCodeableConcept.coding[0].code = #hla#3.53.0#HLA-C*07:01+HLA-C*05:01

Instance: ExampleHLAGenotypeA
InstanceOf: NMDPHLAGenotype
Usage: #example
Title: "Example HLA-A Genotype"
Description: "An example HLA-A genotype observation showing a donor typed as HLA-A*02:01+HLA-A*03:01."
* status = #final
* code = $loinc#57290-9 "HLA-A [Type] by High resolution"
* subject = Reference(ExampleNMDPDonor)
* valueCodeableConcept.coding[0].system = "http://glstring.org"
* valueCodeableConcept.coding[0].code = #hla#3.53.0#HLA-A*02:01+HLA-A*03:01

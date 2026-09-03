Instance: ExampleHLAGenotypeB
InstanceOf: NMDPHLAGenotype
Usage: #example
Title: "Example HLA-B Genotype"
Description: "An example HLA-B genotype observation showing a donor typed as HLA-B*07:02+HLA-B*44:02."
* status = #final
* code = $loinc#57291-7 "HLA-B [Type] by High resolution"
* subject = Reference(ExampleNMDPDonor)
* valueCodeableConcept.coding[0].system = "http://glstring.org"
* valueCodeableConcept.coding[0].code = #hla#3.53.0#HLA-B*07:02+HLA-B*44:02

Instance: ExampleHLAGenotypeDRB1
InstanceOf: NMDPHLAGenotype
Usage: #example
Title: "Example HLA-DRB1 Genotype"
Description: "An example HLA-DRB1 genotype observation showing a donor typed as HLA-DRB1*15:01+HLA-DRB1*03:01."
* status = #final
* code = $loinc#57293-3 "HLA-DRB1 [Type] by High resolution"
* subject = Reference(ExampleNMDPDonor)
* valueCodeableConcept.coding[0].system = "http://glstring.org"
* valueCodeableConcept.coding[0].code = #hla#3.53.0#HLA-DRB1*15:01+HLA-DRB1*03:01

Instance: ExampleHLAGenotypeDRB1
InstanceOf: NMDPHLAGenotype
Usage: #example
Title: "Example HLA-DRB1 Genotype"
Description: "An example HLA-DRB1 genotype observation showing a donor typed as HLA-DRB1*15:01:01+HLA-DRB1*03:01:01."
* status = #final
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = $loinc#84413-4 "Genotype display name"
* subject = Reference(ExampleNMDPDonor)
* effectiveDateTime = "2026-06-15"
* valueCodeableConcept.coding[0].system = "http://glstring.org"
* valueCodeableConcept.coding[0].code = #hla#3.59.0#HLA-DRB1*15:01:01+HLA-DRB1*03:01:01
* component[geneStudied].code = $loinc#48018-6 "Gene studied [ID]"
* component[geneStudied].valueCodeableConcept = NMDPHLAGeneNameCS#HGNC:4948 "HLA-DRB1"

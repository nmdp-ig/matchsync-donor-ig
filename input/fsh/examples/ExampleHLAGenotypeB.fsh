Instance: ExampleHLAGenotypeB
InstanceOf: NMDPHLAGenotype
Usage: #example
Title: "Example HLA-B Genotype"
Description: "An example HLA-B genotype observation showing a donor typed as HLA-B*07:02:01+HLA-B*44:02:01."
* status = #final
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code = $loinc#84413-4 "Genotype display name"
* subject = Reference(ExampleNMDPDonor)
* effectiveDateTime = "2026-06-15"
* valueCodeableConcept.coding[0].system = "http://glstring.org"
* valueCodeableConcept.coding[0].code = #hla#3.59.0#HLA-B*07:02:01+HLA-B*44:02:01
* component[geneStudied].code = $loinc#48018-6 "Gene studied [ID]"
* component[geneStudied].valueCodeableConcept = NMDPHLAGeneNameCS#HGNC:4932 "HLA-B"

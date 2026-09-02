Profile: NMDPHLAGenotype
Parent: Observation
Id: nmdp-hla-genotype
Title: "NMDP HLA Genotype Observation"
Description: "A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code."

* status MS
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains laboratory 1..1
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code 1..1 MS
* code = $loinc#84413-4 "Genotype display name"
* code ^short = "Genotype display name (LOINC 84413-4)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The donor whose HLA was typed"

* effective[x] 0..1 MS
* effective[x] ^short = "When the typing was performed"

* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from NMDPGLStringVS (required)
* valueCodeableConcept ^short = "GL String Code representing the genotype"
* valueCodeableConcept ^definition = "The genotype expressed as a GL String Code from http://glstring.org. Format: hla#<IMGT/HLA-version>#<GL-String>"

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains geneStudied 1..1 MS
* component[geneStudied].code = $loinc#48018-6 "Gene studied [ID]"
* component[geneStudied].code ^short = "Gene studied (LOINC 48018-6)"
* component[geneStudied].value[x] 1..1 MS
* component[geneStudied].value[x] only CodeableConcept
* component[geneStudied].valueCodeableConcept from NMDPHLAGeneNameVS (required)
* component[geneStudied].valueCodeableConcept ^short = "HLA gene name (HGNC ID)"

* specimen 0..1 MS
* performer 0..* MS

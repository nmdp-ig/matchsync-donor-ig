Profile: NMDPHLAGenotype
Parent: Observation
Id: nmdp-hla-genotype
Title: "NMDP HLA Genotype Observation"
Description: "A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code. The Observation.code uses a locus-specific LOINC code identifying which HLA gene was typed."

* status MS
* status = #final

* code 1..1 MS
* code from NMDPHLALocusLOINCVS (required)
* code ^short = "HLA locus-specific LOINC code (e.g., 57290-9 for HLA-A)"
* code ^definition = "A LOINC code identifying the specific HLA locus typed. Each locus has its own code (HLA-A: 57290-9, HLA-B: 57291-7, HLA-C: 57297-4, HLA-DRB1: 57293-3, HLA-DQB1: 57299-0, HLA-DPB1: 59017-4, HLA-DQA1: 59019-0, HLA-DPA1: 59018-2, HLA-DRB3: 57294-1, HLA-DRB4: 57295-8, HLA-DRB5: 57296-6)."

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The donor or CBU whose HLA was typed"

* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from NMDPGLStringVS (required)
* valueCodeableConcept ^short = "GL String Code representing the genotype"
* valueCodeableConcept ^definition = "The genotype expressed as a GL String Code from http://glstring.org. Format: hla#<IMGT/HLA-version>#<GL-String>"

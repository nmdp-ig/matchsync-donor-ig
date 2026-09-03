CodeSystem: NMDPOrderTypeCS
Id: nmdp-order-type
Title: "NMDP Order Type Code System"
Description: "Codes identifying the type of donor or CBU workup order in the NMDP system."
* ^url = "http://fhir.nmdp.org/CodeSystem/order-type"
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #confirmatory-typing "Confirmatory Typing" "HLA confirmatory typing order to verify initial typing results."
* #idm "Infectious Disease Markers" "Infectious disease marker testing order for donor clearance."
* #collection "Collection" "Generic stem cell collection order."
* #pbsc "Peripheral Blood Stem Cell" "Peripheral blood stem cell collection via apheresis."
* #marrow "Bone Marrow" "Bone marrow harvest collection."
* #A-HR "HLA-A High Resolution" "HLA-A high resolution typing order for CBU."
* #B-HR "HLA-B High Resolution" "HLA-B high resolution typing order for CBU."
* #C-HR "HLA-C High Resolution" "HLA-C high resolution typing order for CBU."
* #ABC-DRB1-DQB1-DPB1-HR "Full Panel High Resolution" "Full panel high resolution typing (HLA-A, B, C, DRB1, DQB1, DPB1) order for CBU."

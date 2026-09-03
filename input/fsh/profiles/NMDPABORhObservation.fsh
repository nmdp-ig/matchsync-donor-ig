Profile: NMDPABORhObservation
Parent: Observation
Id: nmdp-abo-rh-observation
Title: "NMDP ABO/Rh Observation"
Description: "An observation representing a donor or CBU's ABO and Rh blood group type. Uses LOINC 882-1 and valueCodeableConcept with codes from LOINC Answer List LL2972-9."

* status MS
* status = #final

* code 1..1 MS
* code = $loinc#882-1 "ABO and Rh group [Type] in Blood"
* code ^short = "ABO and Rh group [Type] in Blood (LOINC 882-1)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The donor or CBU this blood type belongs to"

* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from NMDPABORhTypeVS (required)
* valueCodeableConcept ^short = "ABO/Rh blood type code from LOINC Answer List LL2972-9"
* valueCodeableConcept ^definition = "The ABO and Rh blood group type using codes from LOINC Answer List LL2972-9 (e.g., LA21325-8 = A Pos)."

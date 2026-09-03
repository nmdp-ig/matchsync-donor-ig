Profile: NMDPBodyWeightObservation
Parent: Observation
Id: nmdp-body-weight-observation
Title: "NMDP Body Weight Observation"
Description: "An observation representing a donor's body weight. Uses LOINC 29463-7 and valueQuantity in kg."

* status MS
* status = #final

* code 1..1 MS
* code = $loinc#29463-7 "Body weight"
* code ^short = "Body weight (LOINC 29463-7)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The donor this weight measurement belongs to"

* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity ^short = "Body weight in kg"
* valueQuantity ^definition = "The donor's body weight expressed in kilograms."
* valueQuantity.value 1..1 MS
* valueQuantity.unit 1..1 MS
* valueQuantity.unit = "kg"
* valueQuantity.system 1..1 MS
* valueQuantity.system = $ucum
* valueQuantity.code 1..1 MS
* valueQuantity.code = #kg

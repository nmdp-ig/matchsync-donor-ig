Profile: NMDPHemoglobinObservation
Parent: Observation
Id: nmdp-hemoglobin-observation
Title: "NMDP Hemoglobin Observation"
Description: "An observation representing a CBU's hemoglobin level. Uses LOINC 718-7 (Hemoglobin [Mass/volume] in Blood) and valueQuantity in g/dL."

* status MS
* status = #final

* code 1..1 MS
* code = $loinc#718-7 "Hemoglobin [Mass/volume] in Blood"
* code ^short = "Hemoglobin [Mass/volume] in Blood (LOINC 718-7)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The CBU this hemoglobin measurement belongs to"

* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity ^short = "Hemoglobin in g/dL"
* valueQuantity ^definition = "The CBU's hemoglobin level expressed in grams per deciliter."
* valueQuantity.value 1..1 MS
* valueQuantity.unit 1..1 MS
* valueQuantity.unit = "g/dL"
* valueQuantity.system 1..1 MS
* valueQuantity.system = $ucum
* valueQuantity.code 1..1 MS
* valueQuantity.code = #g/dL

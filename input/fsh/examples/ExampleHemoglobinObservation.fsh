Instance: ExampleCBUHemoglobin
InstanceOf: NMDPHemoglobinObservation
Usage: #example
Title: "Example CBU Hemoglobin Observation"
Description: "An example hemoglobin observation for a Cord Blood Unit (14.2 g/dL)."
* status = #final
* code = $loinc#718-7 "Hemoglobin [Mass/volume] in Blood"
* subject = Reference(ExampleCBUPatient)
* valueQuantity.value = 14.2
* valueQuantity.unit = "g/dL"
* valueQuantity.system = $ucum
* valueQuantity.code = #g/dL

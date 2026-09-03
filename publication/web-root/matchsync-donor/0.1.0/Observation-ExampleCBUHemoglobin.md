# Example CBU Hemoglobin Observation - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example CBU Hemoglobin Observation**

## Example Observation: Example CBU Hemoglobin Observation

Profile: [NMDP Hemoglobin Observation](StructureDefinition-nmdp-hemoglobin-observation.md)

**status**: Final

**code**: Hemoglobin [Mass/volume] in Blood

**subject**: [Unit20180415 CordUnit Female, DoB: 2018-04-15 ( http://nmdp.org/identifier/cbu-source-id#CBU-SRC-20180415-001)](Patient-ExampleCBUPatient.md)

**value**: 14.2 g/dL (Details: UCUM codeg/dL = 'g/dL')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleCBUHemoglobin",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hemoglobin-observation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "718-7",
      "display" : "Hemoglobin [Mass/volume] in Blood"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleCBUPatient"
  },
  "valueQuantity" : {
    "value" : 14.2,
    "unit" : "g/dL",
    "system" : "http://unitsofmeasure.org",
    "code" : "g/dL"
  }
}

```

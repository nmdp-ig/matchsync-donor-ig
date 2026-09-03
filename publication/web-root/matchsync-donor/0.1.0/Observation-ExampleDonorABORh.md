# Example Donor ABO/Rh Observation - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Donor ABO/Rh Observation**

## Example Observation: Example Donor ABO/Rh Observation

Profile: [NMDP ABO/Rh Observation](StructureDefinition-nmdp-abo-rh-observation.md)

**status**: Final

**code**: ABO and Rh group [Type] in Blood

**subject**: [Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)](Patient-ExampleNMDPDonor.md)

**value**: O Pos



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleDonorABORh",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-abo-rh-observation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "882-1",
      "display" : "ABO and Rh group [Type] in Blood"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA21321-7",
      "display" : "O Pos"
    }]
  }
}

```

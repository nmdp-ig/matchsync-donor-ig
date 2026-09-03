# Example Donor Body Weight Observation - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Donor Body Weight Observation**

## Example Observation: Example Donor Body Weight Observation

Profile: [NMDP Body Weight Observation](StructureDefinition-nmdp-body-weight-observation.md)

**status**: Final

**code**: Body weight

**subject**: [Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)](Patient-ExampleNMDPDonor.md)

**value**: 82 kg (Details: UCUM codekg = 'kg')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleDonorBodyWeight",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-body-weight-observation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "29463-7",
      "display" : "Body weight"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "valueQuantity" : {
    "value" : 82,
    "unit" : "kg",
    "system" : "http://unitsofmeasure.org",
    "code" : "kg"
  }
}

```

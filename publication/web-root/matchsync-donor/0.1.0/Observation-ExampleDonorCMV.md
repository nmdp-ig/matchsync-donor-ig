# Example Donor CMV Observation - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Donor CMV Observation**

## Example Observation: Example Donor CMV Observation

Profile: [NMDP CMV Observation](StructureDefinition-nmdp-cmv-observation.md)

**status**: Final

**code**: CMV IgG Ab [Presence] in Serum

**subject**: [Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)](Patient-ExampleNMDPDonor.md)

**value**: Negative



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleDonorCMV",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-cmv-observation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "22244-8",
      "display" : "CMV IgG Ab [Presence] in Serum"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "valueCodeableConcept" : {
    "text" : "Negative"
  }
}

```

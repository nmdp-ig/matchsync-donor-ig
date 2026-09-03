# Example Donor Specimen - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Donor Specimen**

## Example Specimen: Example Donor Specimen

Profile: [NMDP Donor Specimen](StructureDefinition-nmdp-donor-specimen.md)

**status**: Available

**type**: Blood (EDTA)

**subject**: [Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)](Patient-ExampleNMDPDonor.md)

**request**: [ServiceRequest Confirmatory Typing](ServiceRequest-ExampleDonorOrder.md)

### Collections

| | |
| :--- | :--- |
| - | **Collected[x]** |
| * | 2026-07-16 09:30:00+0000 |



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "ExampleDonorSpecimen",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-specimen"]
  },
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://terminology.nmdp.org/codesystem/specimen-type",
      "code" : "blood-edta",
      "display" : "Blood (EDTA)"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "request" : [{
    "reference" : "ServiceRequest/ExampleDonorOrder"
  }],
  "collection" : {
    "collectedDateTime" : "2026-07-16T09:30:00Z"
  }
}

```

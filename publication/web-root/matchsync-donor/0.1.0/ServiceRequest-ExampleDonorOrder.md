# Example Donor CT Order - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Donor CT Order**

## Example ServiceRequest: Example Donor CT Order

Profile: [NMDP Donor Order](StructureDefinition-nmdp-donor-order.md)

**identifier**: `http://nmdp.org/identifier/matchsource-order`/MS-ORD-2026-44321

**status**: Active

**intent**: Order

**code**: Confirmatory Typing

**subject**: [Maria Garcia Female, DoB: 1975-06-20 ( http://nmdp.org/identifier/rid#RID-9988776)](Patient-ExampleRecipientPatient.md)

**occurrence**: 2026-07-20 09:00:00+0000

**authoredOn**: 2026-07-01 10:00:00+0000

**performer**: [Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)](Patient-ExampleNMDPDonor.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ExampleDonorOrder",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order"]
  },
  "identifier" : [{
    "system" : "http://nmdp.org/identifier/matchsource-order",
    "value" : "MS-ORD-2026-44321"
  }],
  "status" : "active",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://fhir.nmdp.org/CodeSystem/order-type",
      "code" : "confirmatory-typing",
      "display" : "Confirmatory Typing"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleRecipientPatient"
  },
  "occurrenceDateTime" : "2026-07-20T09:00:00Z",
  "authoredOn" : "2026-07-01T10:00:00Z",
  "performer" : [{
    "reference" : "Patient/ExampleNMDPDonor"
  }]
}

```

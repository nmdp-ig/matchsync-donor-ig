# Example Donor CT Order - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Donor CT Order**

## Example ServiceRequest: Example Donor CT Order

Profile: [NMDP Donor Order](StructureDefinition-nmdp-donor-order.md)

**identifier**: `http://terminology.nmdp.org/identifier/order`/ORD-2026-001234

**status**: Active

**intent**: Order

**code**: Confirmatory Typing

**subject**: [Marcus James Reynolds Male, DoB: 1985-03-15 ( http://terminology.nmdp.org/identifier/donor#1234567)](Patient-ExampleNMDPDonor.md)

**authoredOn**: 2026-07-15

**requester**: [Organization Minneapolis Blood Center](Organization-ExampleNMDPDonorCenter.md)

**performer**: [Organization Minneapolis Blood Center](Organization-ExampleNMDPDonorCenter.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ExampleDonorOrder",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order"]
  },
  "identifier" : [{
    "system" : "http://terminology.nmdp.org/identifier/order",
    "value" : "ORD-2026-001234"
  }],
  "status" : "active",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://terminology.nmdp.org/codesystem/order-type",
      "code" : "ct",
      "display" : "Confirmatory Typing"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "authoredOn" : "2026-07-15",
  "requester" : {
    "reference" : "Organization/ExampleNMDPDonorCenter"
  },
  "performer" : [{
    "reference" : "Organization/ExampleNMDPDonorCenter"
  }]
}

```

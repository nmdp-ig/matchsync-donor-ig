# Example IDM Order - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example IDM Order**

## Example ServiceRequest: Example IDM Order

Profile: [NMDP IDM Order](StructureDefinition-nmdp-idm-order.md)

**identifier**: `http://terminology.nmdp.org/identifier/order`/ORD-2026-005678

**status**: Active

**intent**: Order

**code**: Infectious Disease Markers

**subject**: [Marcus James Reynolds Male, DoB: 1985-03-15 ( http://terminology.nmdp.org/identifier/donor#1234567)](Patient-ExampleNMDPDonor.md)

**authoredOn**: 2026-07-20

**requester**: [Organization Minneapolis Blood Center](Organization-ExampleNMDPDonorCenter.md)

**performer**: [Organization Minneapolis Blood Center](Organization-ExampleNMDPDonorCenter.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ExampleIDMOrder",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-idm-order"]
  },
  "identifier" : [{
    "system" : "http://terminology.nmdp.org/identifier/order",
    "value" : "ORD-2026-005678"
  }],
  "status" : "active",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://terminology.nmdp.org/codesystem/order-type",
      "code" : "idm",
      "display" : "Infectious Disease Markers"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "authoredOn" : "2026-07-20",
  "requester" : {
    "reference" : "Organization/ExampleNMDPDonorCenter"
  },
  "performer" : [{
    "reference" : "Organization/ExampleNMDPDonorCenter"
  }]
}

```

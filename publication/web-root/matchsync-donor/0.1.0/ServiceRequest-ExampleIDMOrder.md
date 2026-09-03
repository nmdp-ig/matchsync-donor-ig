# Example IDM Order - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example IDM Order**

## Example ServiceRequest: Example IDM Order

Profile: [NMDP IDM Order](StructureDefinition-nmdp-idm-order.md)

**identifier**: `http://nmdp.org/identifier/matchsource-order`/MS-ORD-2026-55678

**status**: Active

**intent**: Order

**code**: Infectious Disease Markers

**subject**: [Maria Garcia Female, DoB: 1975-06-20 ( http://nmdp.org/identifier/rid#RID-9988776)](Patient-ExampleRecipientPatient.md)

**authoredOn**: 2026-07-20

**performer**: [Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)](Patient-ExampleNMDPDonor.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ExampleIDMOrder",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-idm-order"]
  },
  "identifier" : [{
    "system" : "http://nmdp.org/identifier/matchsource-order",
    "value" : "MS-ORD-2026-55678"
  }],
  "status" : "active",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://fhir.nmdp.org/CodeSystem/order-type",
      "code" : "idm",
      "display" : "Infectious Disease Markers"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleRecipientPatient"
  },
  "authoredOn" : "2026-07-20",
  "performer" : [{
    "reference" : "Patient/ExampleNMDPDonor"
  }]
}

```

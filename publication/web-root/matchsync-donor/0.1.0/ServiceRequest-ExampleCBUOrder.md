# Example CBU Order - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example CBU Order**

## Example ServiceRequest: Example CBU Order

Profile: [NMDP CBU Order](StructureDefinition-nmdp-cbu-order.md)

**identifier**: `http://nmdp.org/identifier/matchsource-order`/MS-ORD-2026-99887

**status**: Active

**intent**: Order

**code**: HLA-A High Resolution

**subject**: [Maria Garcia Female, DoB: 1975-06-20 ( http://nmdp.org/identifier/rid#RID-9988776)](Patient-ExampleRecipientPatient.md)

**occurrence**: 2026-08-10 10:00:00+0000

**authoredOn**: 2026-08-01 14:30:00+0000

**performer**: [Unit20180415 CordUnit Female, DoB: 2018-04-15 ( http://nmdp.org/identifier/cbu-source-id#CBU-SRC-20180415-001)](Patient-ExampleCBUPatient.md)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "ExampleCBUOrder",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-cbu-order"]
  },
  "identifier" : [{
    "system" : "http://nmdp.org/identifier/matchsource-order",
    "value" : "MS-ORD-2026-99887"
  }],
  "status" : "active",
  "intent" : "order",
  "code" : {
    "coding" : [{
      "system" : "http://fhir.nmdp.org/CodeSystem/order-type",
      "code" : "A-HR",
      "display" : "HLA-A High Resolution"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleRecipientPatient"
  },
  "occurrenceDateTime" : "2026-08-10T10:00:00Z",
  "authoredOn" : "2026-08-01T14:30:00Z",
  "performer" : [{
    "reference" : "Patient/ExampleCBUPatient"
  }]
}

```

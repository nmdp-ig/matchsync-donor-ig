# NMDP Donor Order - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Donor Order**

## Resource Profile: NMDP Donor Order 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPDonorOrder |

 
A profile representing a donor workup order in the NMDP system. For donors, the ordered item is always confirmatory typing. ServiceRequest.subject references the recipient Patient, and ServiceRequest.performer references the donor Patient. 

**Usages:**

* Derived from this Profile: [NMDP IDM Order](StructureDefinition-nmdp-idm-order.md)
* Refer to this Profile: [NMDP Donor Specimen](StructureDefinition-nmdp-donor-specimen.md)
* Examples for this Profile: [ServiceRequest/ExampleDonorOrder](ServiceRequest-ExampleDonorOrder.md)
* CapabilityStatements using this Profile: [NMDP Donor API Capability Statement](CapabilityStatement-NMDPDonorAPICapabilityStatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-donor-order.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-donor-order.csv), [Excel](StructureDefinition-nmdp-donor-order.xlsx), [Schematron](StructureDefinition-nmdp-donor-order.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-donor-order",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order",
  "version" : "0.1.0",
  "name" : "NMDPDonorOrder",
  "title" : "NMDP Donor Order",
  "status" : "draft",
  "date" : "2026-09-03T16:43:13+00:00",
  "publisher" : "National Marrow Donor Program (NMDP)",
  "contact" : [{
    "name" : "National Marrow Donor Program (NMDP)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nmdp.org"
    },
    {
      "system" : "email",
      "value" : "fhir@nmdp.org"
    }]
  }],
  "description" : "A profile representing a donor workup order in the NMDP system. For donors, the ordered item is always confirmatory typing. ServiceRequest.subject references the recipient Patient, and ServiceRequest.performer references the donor Patient.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "quick",
    "uri" : "http://siframework.org/cqf",
    "name" : "Quality Improvement and Clinical Knowledge (QUICK)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ServiceRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ServiceRequest",
      "path" : "ServiceRequest"
    },
    {
      "id" : "ServiceRequest.identifier",
      "path" : "ServiceRequest.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.identifier:matchsourceOrder",
      "path" : "ServiceRequest.identifier",
      "sliceName" : "matchsourceOrder",
      "short" : "MatchSource order number",
      "definition" : "The order number assigned by the NMDP MatchSource system. System: http://nmdp.org/identifier/matchsource-order",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.identifier:matchsourceOrder.system",
      "path" : "ServiceRequest.identifier.system",
      "min" : 1,
      "patternUri" : "http://nmdp.org/identifier/matchsource-order"
    },
    {
      "id" : "ServiceRequest.identifier:matchsourceOrder.value",
      "path" : "ServiceRequest.identifier.value",
      "min" : 1
    },
    {
      "id" : "ServiceRequest.status",
      "path" : "ServiceRequest.status",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.intent",
      "path" : "ServiceRequest.intent",
      "patternCode" : "order",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
      "short" : "Type of order (e.g., confirmatory-typing)",
      "definition" : "The type of donor order. For donor orders this is always confirmatory typing (code: confirmatory-typing).",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-order-type-vs"
      }
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
      "short" : "The recipient Patient this order is for",
      "definition" : "The recipient Patient (identified by RID) that this donor order is associated with.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.occurrence[x]",
      "path" : "ServiceRequest.occurrence[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "ServiceRequest.occurrence[x]:occurrenceDateTime",
      "path" : "ServiceRequest.occurrence[x]",
      "sliceName" : "occurrenceDateTime",
      "short" : "Appointment date (CT draw appointment)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.authoredOn",
      "path" : "ServiceRequest.authoredOn",
      "short" : "Order submitted date",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.performer",
      "path" : "ServiceRequest.performer",
      "short" : "The donor Patient performing this order",
      "definition" : "The donor Patient (identified by GRID) who will undergo the ordered procedure.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    }]
  }
}

```

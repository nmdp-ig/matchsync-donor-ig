# NMDP IDM Order - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP IDM Order**

## Resource Profile: NMDP IDM Order 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-idm-order | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPIDMOrder |

 
A profile for Infectious Disease Marker (IDM) orders. IDM testing is required for donor clearance before stem cell collection. 

**Usages:**

* Examples for this Profile: [ServiceRequest/ExampleIDMOrder](ServiceRequest-ExampleIDMOrder.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-idm-order.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-idm-order.csv), [Excel](StructureDefinition-nmdp-idm-order.xlsx), [Schematron](StructureDefinition-nmdp-idm-order.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-idm-order",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-idm-order",
  "version" : "0.1.0",
  "name" : "NMDPIDMOrder",
  "title" : "NMDP IDM Order",
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
  "description" : "A profile for Infectious Disease Marker (IDM) orders. IDM testing is required for donor clearance before stem cell collection.",
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
  "baseDefinition" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ServiceRequest",
      "path" : "ServiceRequest"
    },
    {
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
      "short" : "Fixed to IDM order type",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://fhir.nmdp.org/CodeSystem/order-type",
          "code" : "idm",
          "display" : "Infectious Disease Markers"
        }]
      }
    }]
  }
}

```

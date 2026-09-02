# NMDP Order Type Code System - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Order Type Code System**

## CodeSystem: NMDP Order Type Code System 

| | |
| :--- | :--- |
| *Official URL*:http://terminology.nmdp.org/codesystem/order-type | *Version*:0.1.0 |
| Active as of 2026-09-02 | *Computable Name*:NMDPOrderTypeCS |

 
Codes identifying the type of donor workup or collection order in the NMDP system. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NMDP Order Type Value Set](ValueSet-nmdp-order-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nmdp-order-type",
  "url" : "http://terminology.nmdp.org/codesystem/order-type",
  "version" : "0.1.0",
  "name" : "NMDPOrderTypeCS",
  "title" : "NMDP Order Type Code System",
  "status" : "active",
  "date" : "2026-09-02T19:29:11+00:00",
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
  "description" : "Codes identifying the type of donor workup or collection order in the NMDP system.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [{
    "code" : "ct",
    "display" : "Confirmatory Typing",
    "definition" : "HLA confirmatory typing order to verify initial typing results."
  },
  {
    "code" : "idm",
    "display" : "Infectious Disease Markers",
    "definition" : "Infectious disease marker testing order for donor clearance."
  },
  {
    "code" : "collection",
    "display" : "Collection",
    "definition" : "Generic stem cell collection order."
  },
  {
    "code" : "pbsc",
    "display" : "Peripheral Blood Stem Cell",
    "definition" : "Peripheral blood stem cell collection via apheresis."
  },
  {
    "code" : "marrow",
    "display" : "Bone Marrow",
    "definition" : "Bone marrow harvest collection."
  }]
}

```

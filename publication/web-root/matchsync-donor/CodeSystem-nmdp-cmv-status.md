# NMDP CMV Status Code System - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP CMV Status Code System**

## CodeSystem: NMDP CMV Status Code System 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/CodeSystem/cmv-status | *Version*:0.1.0 |
| Active as of 2026-09-03 | *Computable Name*:NMDPCMVStatusCS |

 
Text-based status codes for CMV IgG antibody presence in donor and CBU testing. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NMDP CMV Status Value Set](ValueSet-nmdp-cmv-status-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nmdp-cmv-status",
  "url" : "http://fhir.nmdp.org/CodeSystem/cmv-status",
  "version" : "0.1.0",
  "name" : "NMDPCMVStatusCS",
  "title" : "NMDP CMV Status Code System",
  "status" : "active",
  "date" : "2026-09-03T14:51:12+00:00",
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
  "description" : "Text-based status codes for CMV IgG antibody presence in donor and CBU testing.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "Positive",
    "display" : "Positive",
    "definition" : "CMV IgG antibody detected."
  },
  {
    "code" : "Negative",
    "display" : "Negative",
    "definition" : "CMV IgG antibody not detected."
  },
  {
    "code" : "Inconclusive",
    "display" : "Inconclusive",
    "definition" : "CMV IgG antibody test result is inconclusive."
  },
  {
    "code" : "Untested",
    "display" : "Untested",
    "definition" : "CMV IgG antibody testing has not been performed."
  }]
}

```

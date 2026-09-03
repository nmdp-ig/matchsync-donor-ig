# NMDP Center Type - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Center Type**

## CodeSystem: NMDP Center Type 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/CodeSystem/nmdp-center-type | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPCenterTypeCS |

 
Types of centers in the NMDP network. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NMDP Center Type ValueSet](ValueSet-nmdp-center-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nmdp-center-type",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/CodeSystem/nmdp-center-type",
  "version" : "0.1.0",
  "name" : "NMDPCenterTypeCS",
  "title" : "NMDP Center Type",
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
  "description" : "Types of centers in the NMDP network.",
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
    "code" : "donor-center",
    "display" : "Donor Center",
    "definition" : "A center that recruits and manages donors."
  },
  {
    "code" : "transplant-center",
    "display" : "Transplant Center",
    "definition" : "A center that performs transplants."
  },
  {
    "code" : "collection-center",
    "display" : "Collection Center",
    "definition" : "A center that collects stem cells or marrow."
  },
  {
    "code" : "apheresis-center",
    "display" : "Apheresis Center",
    "definition" : "A center that performs apheresis procedures."
  },
  {
    "code" : "cord-blood-bank",
    "display" : "Cord Blood Bank",
    "definition" : "A facility that stores cord blood units."
  }]
}

```

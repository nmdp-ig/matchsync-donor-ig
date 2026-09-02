# NMDP Specimen Type Code System - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Specimen Type Code System**

## CodeSystem: NMDP Specimen Type Code System 

| | |
| :--- | :--- |
| *Official URL*:http://terminology.nmdp.org/codesystem/specimen-type | *Version*:0.1.0 |
| Active as of 2026-09-02 | *Computable Name*:NMDPSpecimenTypeCS |

 
Codes identifying the type of specimen collected from a donor for HLA typing or infectious disease marker testing. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NMDP Specimen Type Value Set](ValueSet-nmdp-specimen-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nmdp-specimen-type",
  "url" : "http://terminology.nmdp.org/codesystem/specimen-type",
  "version" : "0.1.0",
  "name" : "NMDPSpecimenTypeCS",
  "title" : "NMDP Specimen Type Code System",
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
  "description" : "Codes identifying the type of specimen collected from a donor for HLA typing or infectious disease marker testing.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 7,
  "concept" : [{
    "code" : "blood-acd",
    "display" : "Blood (ACD)",
    "definition" : "Whole blood collected in an ACD (Acid Citrate Dextrose) anticoagulant tube."
  },
  {
    "code" : "blood-edta",
    "display" : "Blood (EDTA)",
    "definition" : "Whole blood collected in an EDTA anticoagulant tube."
  },
  {
    "code" : "blood-no-anticoagulant",
    "display" : "Blood (No Anticoagulant)",
    "definition" : "Whole blood collected without anticoagulant."
  },
  {
    "code" : "blood-sodium-heparin",
    "display" : "Blood (Sodium Heparin)",
    "definition" : "Whole blood collected in a sodium heparin anticoagulant tube."
  },
  {
    "code" : "buccal-swab",
    "display" : "Buccal Swab",
    "definition" : "Buccal epithelial cells collected via oral swab."
  },
  {
    "code" : "hair-root",
    "display" : "Hair Root",
    "definition" : "Hair follicle root sample for DNA extraction."
  },
  {
    "code" : "saliva",
    "display" : "Saliva",
    "definition" : "Saliva sample for DNA extraction."
  }]
}

```

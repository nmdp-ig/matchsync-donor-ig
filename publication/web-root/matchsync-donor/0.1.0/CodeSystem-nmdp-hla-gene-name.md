# NMDP HLA Gene Name Code System - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP HLA Gene Name Code System**

## CodeSystem: NMDP HLA Gene Name Code System 

| | |
| :--- | :--- |
| *Official URL*:http://terminology.nmdp.org/codesystem/hla-gene-name | *Version*:0.1.0 |
| Active as of 2026-09-03 | *Computable Name*:NMDPHLAGeneNameCS |

 
HGNC Gene IDs for HLA loci used in donor typing. Subset of HGNC relevant to NMDP operations. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NMDP HLA Gene Name Value Set](ValueSet-nmdp-hla-gene-name-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nmdp-hla-gene-name",
  "url" : "http://terminology.nmdp.org/codesystem/hla-gene-name",
  "version" : "0.1.0",
  "name" : "NMDPHLAGeneNameCS",
  "title" : "NMDP HLA Gene Name Code System",
  "status" : "active",
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
  "description" : "HGNC Gene IDs for HLA loci used in donor typing. Subset of HGNC relevant to NMDP operations.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
    "code" : "HGNC:4931",
    "display" : "HLA-A",
    "definition" : "Human Leukocyte Antigen class I, locus A"
  },
  {
    "code" : "HGNC:4932",
    "display" : "HLA-B",
    "definition" : "Human Leukocyte Antigen class I, locus B"
  },
  {
    "code" : "HGNC:4933",
    "display" : "HLA-C",
    "definition" : "Human Leukocyte Antigen class I, locus C"
  },
  {
    "code" : "HGNC:4948",
    "display" : "HLA-DRB1",
    "definition" : "Human Leukocyte Antigen class II, DR beta 1"
  },
  {
    "code" : "HGNC:4944",
    "display" : "HLA-DQB1",
    "definition" : "Human Leukocyte Antigen class II, DQ beta 1"
  },
  {
    "code" : "HGNC:4940",
    "display" : "HLA-DPB1",
    "definition" : "Human Leukocyte Antigen class II, DP beta 1"
  }]
}

```

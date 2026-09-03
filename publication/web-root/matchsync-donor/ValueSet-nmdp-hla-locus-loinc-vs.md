# NMDP HLA Locus LOINC Value Set - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP HLA Locus LOINC Value Set**

## ValueSet: NMDP HLA Locus LOINC Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-hla-locus-loinc-vs | *Version*:0.1.0 |
| Active as of 2026-09-03 | *Computable Name*:NMDPHLALocusLOINCVS |

 
LOINC codes for HLA locus-specific high resolution typing observations used in NMDP donor and CBU payloads. 

 **References** 

* [NMDP HLA Genotype Observation](StructureDefinition-nmdp-hla-genotype.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "nmdp-hla-locus-loinc-vs",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-hla-locus-loinc-vs",
  "version" : "0.1.0",
  "name" : "NMDPHLALocusLOINCVS",
  "title" : "NMDP HLA Locus LOINC Value Set",
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
  "description" : "LOINC codes for HLA locus-specific high resolution typing observations used in NMDP donor and CBU payloads.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "57290-9",
        "display" : "HLA-A [Type] by High resolution"
      },
      {
        "code" : "57291-7",
        "display" : "HLA-B [Type] by High resolution"
      },
      {
        "code" : "57297-4",
        "display" : "HLA-Cw [Type] by High resolution"
      },
      {
        "code" : "57293-3",
        "display" : "HLA-DRB1 [Type] by High resolution"
      },
      {
        "code" : "57299-0",
        "display" : "HLA-DQB1 [Type] by High resolution"
      },
      {
        "code" : "59017-4",
        "display" : "HLA-DPB1 [Type] by High resolution"
      },
      {
        "code" : "59019-0",
        "display" : "HLA-DQA1 [Type] by High resolution"
      },
      {
        "code" : "59018-2",
        "display" : "HLA-DPA1 [Type] by High resolution"
      },
      {
        "code" : "57294-1",
        "display" : "HLA-DRB3 [Type] by High resolution"
      },
      {
        "code" : "57295-8",
        "display" : "HLA-DRB4 [Type] by High resolution"
      },
      {
        "code" : "57296-6",
        "display" : "HLA-DRB5 [Type] by High resolution"
      }]
    }]
  }
}

```

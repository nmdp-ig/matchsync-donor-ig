# GL String Code Value Set - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GL String Code Value Set**

## ValueSet: GL String Code Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-glstring-vs | *Version*:0.1.0 |
| Active as of 2026-09-02 | *Computable Name*:NMDPGLStringVS |

 
Genotype List String Codes from glstring.org. Codes represent HLA genotypes in GL String format (e.g., hla#3.25.0#HLA-A**01:01:01:01+HLA-A**01:02). 

 **References** 

* [NMDP HLA Genotype Observation](StructureDefinition-nmdp-hla-genotype.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

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
  "id" : "nmdp-glstring-vs",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-glstring-vs",
  "version" : "0.1.0",
  "name" : "NMDPGLStringVS",
  "title" : "GL String Code Value Set",
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
  "description" : "Genotype List String Codes from glstring.org. Codes represent HLA genotypes in GL String format (e.g., hla#3.25.0#HLA-A*01:01:01:01+HLA-A*01:02).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://glstring.org"
    }]
  }
}

```

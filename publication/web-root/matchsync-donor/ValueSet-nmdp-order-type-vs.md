# NMDP Order Type Value Set - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Order Type Value Set**

## ValueSet: NMDP Order Type Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-order-type-vs | *Version*:0.1.0 |
| Active as of 2026-09-03 | *Computable Name*:NMDPOrderTypeVS |

 
All codes from the NMDP Order Type code system. 

 **References** 

* [NMDP CBU Order](StructureDefinition-nmdp-cbu-order.md)
* [NMDP Donor Order](StructureDefinition-nmdp-donor-order.md)

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
  "id" : "nmdp-order-type-vs",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-order-type-vs",
  "version" : "0.1.0",
  "name" : "NMDPOrderTypeVS",
  "title" : "NMDP Order Type Value Set",
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
  "description" : "All codes from the NMDP Order Type code system.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://fhir.nmdp.org/CodeSystem/order-type"
    }]
  }
}

```

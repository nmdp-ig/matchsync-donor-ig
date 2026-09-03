# CBU Status - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CBU Status**

## Extension: CBU Status 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/cbu-status | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:CBUStatus |

The availability status of a Cord Blood Unit (CBU) in the NMDP registry. Conveyed as a simple string value (e.g., 'Available').

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NMDP Cord Blood Unit (CBU) Patient](StructureDefinition-nmdp-cbu-patient.md)
* Examples for this Extension: [Patient/ExampleCBUPatient](Patient-ExampleCBUPatient.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-cbu-status.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-cbu-status.csv), [Excel](StructureDefinition-cbu-status.xlsx), [Schematron](StructureDefinition-cbu-status.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "cbu-status",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/cbu-status",
  "version" : "0.1.0",
  "name" : "CBUStatus",
  "title" : "CBU Status",
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
  "description" : "The availability status of a Cord Blood Unit (CBU) in the NMDP registry. Conveyed as a simple string value (e.g., 'Available').",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Patient"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "CBU Status",
      "definition" : "The availability status of a Cord Blood Unit (CBU) in the NMDP registry. Conveyed as a simple string value (e.g., 'Available')."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/cbu-status"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "CBU availability status",
      "definition" : "The current availability status of the cord blood unit in the NMDP registry.",
      "min" : 1,
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
